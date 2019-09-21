### 运行时架构 

![img](https://raw.githubusercontent.com/jgr-great/fabric-note/master/image/fw.png) 

1) APP：代表一个客户端（CLI）或SDK，作用是创建交易并获取到足够的背书之后向Orderer排序服务节点提交交易请求（Peer与Orderer节点提供了gRPC远程访问接口，供客户端调用）。

2) CA：负责对网络中所有的证书进行管理(对Fabric网络中的成员身份进行管理), 提供标准的PKI服务。

> PKI：公钥基础设施 [reference](https://hyperledger-fabric.readthedocs.io/en/latest/identity/identity.html)

3) MSP（Member Service Provider）：为客户端和Peer提供证书的系统抽象组件。

4) Channel：将一个大的网络分割成为不同的私有"子网"。通道提供一种通讯机制，将peers和orderer连接在一起，形成一个具有保密性的通讯链路（虚拟）， 进行数据隔离。

要加入通道的每个节点都必须拥有自己的通过成员服务提供商（MSP）获得的身份标识。

5) Orderer：对客户端提交的交易请求进行排序，之后生成区块广播给通道内的所有peer节点。

6) Org1：代表联盟中的某一个组织（一个联盟中可以多个不同的组织组成）。

7) Peer：表示组织中的节点；Peer节点以区块的形式从Orderer排序服务节点接收有序状态更新，维护状态和账本。在Fabtic网络环境中 Peer 节点可以划分为如下角色：

* ​	Endorsing peer：根据指定的策略调用智能合约，对结果进行背书， 返回提案响应到客户端。
* Committing peer：验证数据并保存至账本中。

* Anchor peer：跨组织通信。

* Leading peer：作为组织内所有节点的的代表连接到Orderer排序服务节点, 将从排序服务节点接收到的批量区块广播给组织内的其它节点。

网络中只有部分节点为背书节点； 

网络中所有Peer节点为账本节点。

8) Chaincode：运行在容器中，提供相应的API与账本数据进行交互。

9) Ledger：是由排序服务构建的一个全部有序的交易哈希链块，保存在所有的peer节点中。账本提供了在系统运行过程中发生的可验证历史，它包含所有成功的状态更改（有效交易）和不成功的状态更改（无效交易）。



