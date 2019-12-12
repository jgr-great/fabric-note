### 交易流程

1. Client 在CA注册身份

![img](../image/step0.png)

2. Client A调用指定SDK构建交易提案（proposal）请求，并打包为一个正确格式
   * 提案包含以下几个要素
     * ChannelID：通道信息
     * chaincode：要调用的链码信息
     * timestamp：时间戳
     * sign：客户端签名
     * txPayload：提交事务本身的内容

![img](../image/step1.png) 

3. peer验证tx信息，签名响应，执行交易

验证信息如下：

* 交易提案格式正确，

* 过去未提交过（重放攻击保护），

* 签名有效（使用MSP），

* 提交者（示例中的客户端A）被正确授权在该频道上执行建议的操作（即，每个支持同伴确保提交者满足频道的作者政策）

>  这一流程没有更新账本，改变的是world state

![img](../image/step2.png) 

 

4. App验证响应信息

APP验证背书peer的签名，并且对比peer们的响应是否一样。

如果chaincode只是查询账本，APP不会检查查询的响应，也不会将此次交易发送给Orderer。

如果chaincode会想要更新账本。在提交到orderer之前，APP会检查背书策略是否满足。

如果APP不检查响应，或以其他方式发送一个未经认可的交易。<u>在commit验证阶段，peer会强制执行背书策略</u>(不确定)。

应用程序在“交易消息”中将交易提议和响应“广播”到Ordering Service。Ordering Service不需要检查交易的全部内容，它只是从网络中的所有channel中接收交易，按时间顺序按渠道对它们进行排序，并创建每个通道的交易块。

![img](../image/step4.png)

5. block被分发到同一channel上的**Leader**节点。验证block内的交易，并被标记为有效或无效。

* 验证信息：
  * 背书策略
  * 在第2步执行交易后生成的read集账本无变化

![img](../image/step5.png) 

6. Leader 节点同步广播给同组织内的、同一通道内的其他节点。跨组织广播由组织内的锚节点（anchor peer）负责。

   > 广播数量可以通过配置文件修改

7. 账本更新，每个peer将区块附加到区块链中。并发出事件通知客户端交易是否有效。

---

### Fabric CA

Fabric CA服务基于X.509实现。

加入Fabric联盟链的计算机结点和用户都必须要经过注册并获得CA颁发的证书，才能在联盟链中操作。证书颁发机构可以提供的功能如下：

- 身份的注册 或连接到LDAP（Lightweight Directory Access Protocol，轻量目录访问协议），作为用户注册表;

- 签发登记证书（ECerts）（Enrollment Certificates）

- 签发交易证书（TCerts）（Transaction Certificates）

  在Hyperledger Fabric blockchain上交易时提供匿名性和不可链接性。

- 证书续期和撤销

注册成功的最终结果是CA颁发证书，再通过证书生成Token，最终是Token发送给用户，用于用户在联盟链中增加、查询的身份凭证。

CA的架构图如下 ：

![fabric-ca](file:///Users/jiang/project/own_project/fabric-note/trias/fabric-ca.png?lastModify=1576129505)

Fabric Server端由一个服务器集群组成，以树形架构组织CA Server节点，包含一个Root 节点和多个中间节点。每个CA要么是根CA，要么是中间CA。每个中间CA都有一个父CA，它要么是根CA，要么是另一个中间CA。

可以通过Client或SDK与服务器集群中的CA服务器进行交互。客户端首先路由到HA代理，由代理进行负载均衡，将客户端连接至某一服务器的集群成员。

包括前端的一个高可用的代理服务器，连接着若干个CA Server集群，这些集群将数据共同存放在同一个数据服务器上。数据库可能是MySQL、LDAP、PostgresSQL或者SQLite（集群环境中不推荐使用SQLite）。

集群中的所有CA服务器都共享相同的数据库，以跟踪身份和证书。如果配置了LDAP，则将标识信息保存在LDAP中而不是数据库中。



* X.509证书链

**证书链**（也就是RFC 5280里的证书路径)是从终端用户证书后跟着一系列的CA证书，而通常最后一个是自签名证书，并且有如下关系：

1. 在证书链上除最后一个证书外，证书颁发者等于其后一个证书的主题。
2. 除了最后一个证书，每个证书都是由其后的一个证书签名的。
3. 最后的证书是信任主题，由于是通过可信过程得到的，你可以信任它。

证书链用于检查目标证书（证书链里的第一个证书）里的公钥及其它数据是否属于其主题。检查是这么做的：用证书链中的下一个证书的公钥来验证它的签名，一直检查到证书链的尾端，如果所有验证都成功通过，那个这个证书就是可信的。

* PKI交叉认证

为了让PKI2的用户证书也得到PKI1的信任，CA1生成一包含CA2公钥的证书cert2.1，这时候cert2和cert2.1具体相同的主题及公钥，cert2.2 (User 2)就有了两条合法的证书链："cert2.2 → cert2" and "cert2.2 → cert2.1 → cert1"。

CA2也可以生成类似的包含有CA1公钥的证书cert1.1，以便PKI1的用户(比如User 1)的证书能在PKI2得到认证。

Fabric依靠X.509这些性质与**MSP**模块映射为通道、组织的逻辑关系，以完成权限控制。MSP是CA的一个抽象。



### Fabric CRL

Fabric会把一个被吊销的证书放到CRL（Certificate Revocation Lists）中。当A想要验证B的证书时，他首先会到CRL中查看B的证书是否被吊销。

在Fabric CA服务器中吊销证书后，还必须更新Hyperledger Fabric中的相应MSP。这包括对等方的本地MSP以及相应通道配置块中的MSP。为此，必须将PEM编码的CRL（证书吊销列表）文件放在 MSP 的crls文件夹中。

### CA添加组织流程

1. 获取最新的配置块

2. 生成所需组织配置文件（手动）

   * crypto.yaml，用于生成key和证书

     ```shell
     cryptogen generate --config=./org-crypto.yaml
     ```

   * 将生成的配置转化为json，会用到configtx.yaml

     ```shell
     export FABRIC_CFG_PATH=$PWD && configtxgen -printOrg Org3MSP > org.json
     ```

3. 根据生成的配置文件构造相应对象

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

   

4. 新组织的配置与旧配置组合生成新的pb格式的配置

5. 签名提交更新，更新账本

---

### CA添加peer

通过CA client添加peer

1. 登记节点
2. 注册节点，这里会返回私钥和证书

![idemix-overview](./idemix-overview.png)