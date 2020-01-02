## CA概述

Fabric CA服务基于X.509实现。

### X509

**X.509** 是密码学里公钥证书的格式标准

### X.509证书结构

- **Signature Algorithm**：用于算法[签名](https://en.wikipedia.org/wiki/Digital_signature)的公钥证书。
- **Serial Numbe**：用于在CA系统中唯一标识证书。它可以用于跟踪吊销信息。
- **Subject**：证书所属的实体：机器，个人或组织。
- **Issuer**：验证信息并签署证书的实体。
- **Not Before**：证书有效的最早时间和日期。
- **Not After**：证书不再有效的时间和日期。

- **Basic Constraints**: 用于指示证书是否属于一个CA.
- **Key Usage**: 说明证书可以用与哪种用途，比如用于签名，或者用于加密
- **Subject Key Identifier**: 提供一种识别包含特定公钥证书的方法。**CA**证书一定有这个字段。这个字段的值一定会等于该CA证书发行的证书的**authority key identifier**的值。他的值是用**CA公钥派生**的，即自签名。
- **Authority Key Identifier**: 授权密钥标识符扩展提供了一种识别与用于签署证书的私钥相对应的公钥的方法。**发行者的公钥**。

* **Public Key**：属于证书主题的公钥。

- **Signature**：证书主体通过颁发者的私钥的签名

Key Usage, Subject Key Identifier, Authority Key Identifier 属于**Extentions**类别。

### X.509证书链

证书链（也就是RFC 5280里的证书路径)是从终端用户证书后跟着一系列的CA证书，而通常最后一个是自签名证书，并且有如下关系：

- 在证书链上除最后一个证书（根证书）外，证书颁发者等于其后一个证书的主题。
- 除了最后一个证书，每个证书都是由其后的一个证书签名的。
- 最后的证书是信任主题，由于是通过可信过程得到的，你可以信任它。

![x509-1](./image/x509-chain.png?lastModify=1577326970)



证书链用于检查目标证书（证书链里的第一个证书）里的公钥及其它数据是否属于其issuer。

检查：用证书链中的下一个证书的公钥来验证它的签名，一直检查到证书链的尾端，如果所有验证都成功通过，那个这个证书就是可信的。

### PKI交叉认证

CA证书可以来自多个颁发者，或者来自相同颁发者但用不同的私钥签发，这样在CA证书上会出现分叉，从而可以出现多条证书链。

为了让PKI2的用户证书也得到PKI1的信任，CA1生成一包含CA2公钥的证书cert2.1，这时候cert2和cert2.1具体相同的主题及公钥，cert2.2就有了两条合法的证书链："cert2.2 → cert2" 和 "cert2.2 → cert2.1 → cert1"。 CA2也可以生成类似的包含有CA1公钥的证书cert1.1，以便PKI1的用户的证书能在PKI2得到认证.

 Fabric依靠X.509这些性质与MSP模块映射为通道、组织的逻辑关系，以完成权限控制.

- 方块代表证书，加黑的是证书的主题名字。
- A → B 表示 "A是由B签发的" （更确切地说，A是由B中所载公钥对应的私钥签署的）
- 相同颜色（透明色和白色除外）的证书具有相同的公钥

![x509-1](./image/x509-2.png?lastModify=1577326970)

### MSP



### MSP的结构

![img](file:///Users/jiang/project/own_project/fabric-note/CA/image/membership.diagram.5.png?lastModify=1577675761)

**Root CAs**：此文件夹包含由此MSP代表的组织信任的根CA的自签名X.509证书的列表。此MSP文件夹中必须至少有一个Root CA X.509证书。

它标识了必须根CA派生的证书才能被视为相应组织的成员的CA

**Intermediate CAs**：选择性的。此文件夹包含此组织信任的中间CA的X.509证书的列表。每个证书必须由MSP中的一个根CA签名，或由其发行CA链最终引回到受信任的根CA的中间CA签名。

中间CA可以代表组织的不同细分，也可以代表组织本身

**Organizational Units (OUs)**：持有具有特定OU的身份，默认member。

**Administrators**：定义了具有该组织管理员角色的参与者。

**Revoked Certificates**：如果某一成员的身份已被吊销，则有关身份的标识信息（而不是身份本身）保存在此文件夹中。

**`KeyStore`**:私钥。

**Node Identity**:该节点身份和，加密材料。一般在`/peers/peer.org1.example.com/msp/cacert` 内

**TLS Root CA**：用于peer和orderer之间通信，比如更新账本。不是用于APP和管理员之间的通信。

**TLS Intermediate CA**：选择性的。

### MSP与X509

MSP的权限控制主要依赖X509中的issuer和subject字段，issuer和subject中包含O或OU两个字段，O代表改证书属于哪一个组织，OU代表属于组织中的哪一种角色。

MSP可以配置有一组根证书颁发机构（rCA），以及可选的一组中间证书颁发机构（iCA）。

```
       rCA1                rCA2         rCA3
      /    \                 |            |
   iCA1    iCA2             iCA3          id
    / \      |               |
iCA11 iCA12 id              id
 |
id
```

此MSP实例的*有效*身份必须满足以下条件：

- 它们采用X.509证书的形式，带有可验证的证书路径，可以精确地指向信任证书的根之一。
- 它们不包含在任何CRL中；
- 他们在其X.509证书结构的字段中列出了MSP配置的一个或多个组织单位`OU`

在MSP配置中将组织单位指定为两个值对，例如分别表示代表该组织单位的证书颁发机构的（父证书，ou-string）和实际组织单位标识符。如果证书C由在MSP配置中指定了组织单位的iCA或rCA签名，则C除其他要求外，如果在其OU字段中包括ou-string，则认为C有效。

* peer CA

```verilog
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            99:46:ba:88:78:69:67:41:35:05:d4:81:76:bd:b5:62
        Signature Algorithm: ecdsa-with-SHA256
        Issuer: C = US, ST = California, L = San Francisco, O = org1.example.com, CN = ca.org1.example.com
        Validity
            Not Before: Dec 19 12:48:00 2019 GMT
            Not After : Dec 16 12:48:00 2029 GMT
        Subject: C = US, ST = California, L = San Francisco, OU = peer, CN = peer0.org1.example.com
        Subject Public Key Info:
            Public Key Algorithm: id-ecPublicKey
                Public-Key: (256 bit)
                pub:
                    04:65:d9:13:a5:59:6e:c2:4f:d3:7f:4a:aa:35:28:
                    c0:99:33:9a:d7:f2:e0:b9:91:d4:34:69:bf:c1:a7:
                    38:ff:2b:0f:1e:2e:c0:1c:a4:a5:25:62:ea:a0:68:
                    a0:19:9f:d6:a6:d8:ef:81:cc:4f:06:d1:88:6e:dc:
                    e1:bc:a3:35:72
                ASN1 OID: prime256v1
                NIST CURVE: P-256
        X509v3 extensions:
            X509v3 Key Usage: critical
                Digital Signature
            X509v3 Basic Constraints: critical
                CA:FALSE
            X509v3 Authority Key Identifier:
                keyid:72:96:24:35:0B:AD:7E:D8:D6:21:79:B1:F2:E6:3B:DA:47:05:19:C3:68:A2:20:0D:B9:88:2E:4B:9C:79:E9:35

    Signature Algorithm: ecdsa-with-SHA256
         30:44:02:20:05:fb:c7:e7:b9:a9:1b:7f:c9:d5:b2:68:83:f0:
         b2:3b:44:b2:eb:b0:34:a6:66:03:88:47:9e:0b:3d:0b:63:21:
         02:20:1f:c5:7e:84:bf:d6:2d:d2:45:01:31:0b:5e:b5:fe:ba:
         c8:5e:bc:df:71:d5:70:d7:ac:82:f2:af:76:d6:36:fa
```



* 根CA

```verilog
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            11:c6:8c:23:90:45:95:29:7c:91:a2:7d:51:3c:95:fc
        Signature Algorithm: ecdsa-with-SHA256
        Issuer: C = US, ST = California, L = San Francisco, O = org1.example.com, CN = ca.org1.example.com
        Validity
            Not Before: Dec 19 12:48:00 2019 GMT
            Not After : Dec 16 12:48:00 2029 GMT
        Subject: C = US, ST = California, L = San Francisco, O = org1.example.com, CN = ca.org1.example.com
        Subject Public Key Info:
            Public Key Algorithm: id-ecPublicKey
                Public-Key: (256 bit)
                pub:
                    04:ef:e4:23:7c:e9:e8:27:f7:1d:c7:f5:2c:d8:a6:
                    27:fc:39:74:3a:a3:e7:1a:03:05:73:96:50:13:6d:
                    43:f7:4a:d2:cf:10:81:1c:21:a3:fc:6e:f2:6d:2f:
                    be:83:0b:24:bb:ef:c3:0c:b1:3e:bc:fb:c2:f2:69:
                    30:c9:e8:b8:6a
                ASN1 OID: prime256v1
                NIST CURVE: P-256
        X509v3 extensions:
            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment, Certificate Sign, CRL Sign
            X509v3 Extended Key Usage:
                Any Extended Key Usage
            X509v3 Basic Constraints: critical
                CA:TRUE
            X509v3 Subject Key Identifier:
                72:96:24:35:0B:AD:7E:D8:D6:21:79:B1:F2:E6:3B:DA:47:05:19:C3:68:A2:20:0D:B9:88:2E:4B:9C:79:E9:35
    Signature Algorithm: ecdsa-with-SHA256
         30:45:02:21:00:d1:7d:8e:12:e6:9e:8a:5d:30:e1:c7:3e:15:
         a1:a2:42:60:a0:f5:6a:cb:ed:fb:20:b3:3d:e3:f4:b3:8d:57:
         71:02:20:34:ba:04:b4:96:5f:8d:db:ec:c8:18:c9:7a:41:da:
         36:d6:b5:13:13:87:b2:01:49:ec:9f:0e:2b:6f:93:ae:6b
```



Org1有一个Org1.MSP，由Org1.MSP派生角色ICA和RCA；

另一种情况，一个大型组织有不同部门，分管不同职责。像Org2、

![](./image/membership.diagram.3.png)

---

![](./image/membership.diagram.4.png)

Channel MSP和local MSP的主要区别是作用域不一样。

管理员`B`连接到peer，这个peer的证书是由`RCA1`发行，并在本地MSP中存储。当`B`尝试在peer上安装智能合约时，peer会检查其本地MSP-- `ORG1-MSP`，以验证的身份`B`确实是`ORG1`的成员。成功的验证将使install命令成功完成。随后，`B`希望在通道上实例化智能合约。因为这是channel上的操作，所以channel上的所有组织都必须对此表示同意。因此，peer必须先检查通道的MSP，然后才能成功提交此命令。

**本地MSP仅在**它们应用到**的节点或用户的文件系统上定义**。因此，在物理上和逻辑上，每个节点或用户只有一个本地MSP。但是，由于channel MSP可用于channel中的所有节点，因此它们在channel配置中逻辑定义一次。但是， **channel MSP也会在channel中每个节点的文件系统上实例化，并通过共识保持同步**。因此，尽管在每个节点的本地文件系统上都有每个channel MSP的副本，但从逻辑上讲，channel MSP驻留在channel或网络上并由channel或网络维护。

---

#### CA

![](./image/fabric-ca.png)

加入Fabric联盟链的计算机结点和用户都必须要经过注册并获得CA颁发的证书，才能在联盟链中操作。证书颁发机构可以提供的功能如下：

* 身份的注册 或连接到LDAP（Lightweight Directory Access Protocol，轻量目录访问协议），作为用户注册表;
* 签发登记证书（ECerts）（Enrollment Certificates）
* 签发交易证书（TCerts）（Transaction Certificates）
   在Hyperledger Fabric blockchain上交易时提供匿名性和不可链接性。
* 证书续期和撤销
  注册成功的最终结果是CA颁发证书，再通过证书生成Token，最终是Token发送给用户，用于用户在联盟链中增加、查询的身份凭证。


Fabric Server端由一个服务器集群组成，以树形架构组织CA Server节点，包含一个Root 节点和多个中间节点。每个CA要么是根CA，要么是中间CA。每个中间CA都有一个父CA，它要么是根CA，要么是另一个中间CA。

可以通过Client或SDK与服务器集群中的CA服务器进行交互。客户端首先路由到HA代理，由代理进行负载均衡，将客户端连接至某一服务器的集群成员。

包括前端的一个高可用的代理服务器，连接着若干个CA Server集群，这些集群将数据共同存放在同一个数据服务器上。数据库可能是MySQL、LDAP、PostgresSQL或者SQLite（集群环境中不推荐使用SQLite）。

集群中的所有CA服务器都共享相同的数据库，以跟踪身份和证书。如果配置了LDAP，则将标识信息保存在LDAP中而不是数据库中。

### Fabric CRL
Fabric会把一个被吊销的证书放到CRL（Certificate Revocation Lists）中。当A想要验证B的证书时，他首先会到CRL中查看B的证书是否被吊销。
在Fabric CA服务器中吊销证书后，还必须更新Hyperledger Fabric中的相应MSP。这包括对等方的本地MSP以及相应通道配置块中的MSP。为此，必须将PEM编码的CRL（证书吊销列表）文件放在 MSP 的crls文件夹中。

### CA添加组织流程
获取最新的配置块
生成所需组织配置文件（手动）

* crypto.yaml，用于生成key和证书
   `cryptogen generate --config=./org-crypto.yaml`
* 将生成的配置转化为json，会用到configtx.yaml
   `export FABRIC_CFG_PATH=$PWD && configtxgen -printOrg Org3MSP > org.json`
  根据生成的配置文件构造相应对象

```json
 {
  "payload":{
    "header":{
      "channel_header":{
        "channel_id":"'$CHANNEL_NAME'",
        "type":2,
      }
    },
    "data":{
      "config_update":"$(cat org3_update.json)"
    }
  }
}
```



* 新组织的配置与旧配置组合生成新的pb格式的配置
* 签名提交更新，更新账本
