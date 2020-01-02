```shell
/opt/gopath/src/github.com/hyperledger/fabric/aberic/crypto-config/peerOrganizations/org1.example.com/msp/config.yaml

/opt/gopath/src/github.com/hyperledger/fabric/aberic/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/config.yaml

/opt/gopath/src/github.com/hyperledger/fabric/aberic/crypto-config/peerOrganizations/org2.example.com/msp/config.yaml

/opt/gopath/src/github.com/hyperledger/fabric/aberic/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/msp/config.yaml

/opt/gopath/src/github.com/hyperledger/fabric/aberic/crypto-config/peerOrganizations/org3.example.com/msp/config.yaml

/opt/gopath/src/github.com/hyperledger/fabric/aberic/crypto-config/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/msp/config.yaml
```

![](./image/membership.diagram.2.png)

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

**Node Identity**:该节点身份和，加密材料。一般在`/peers/peer.org1.example.com/msp/cacert` 内

**TLS Root CA**：用于peer和orderer之间通信，比如更新账本。不是用于APP和管理员之间的通信。

**TLS Intermediate CA**：选择性的。