endorsing peer

committing peer



#### transaction

header：

signature：发请求一方的签名

proposal：请求背书的一些参数

reponse：chaincode模拟执行的结果，执行结果前后的数据

endorsements：为交易背书的peer



#### world state

存储账本的当前信息，好处之一不需要遍历区块

---

#### Smart Contract & chaincode

---

#### chaincode与账本

App通过SDK或直接与chaincode交互，发出如get、delete、put的请求。

put在更新world state的同时，还会在块上面追加交易信息。

delete时，会删除world state的相关信息，但不会删除区块内的记录，会在区块内增加一条delete的交易信息。



SDK可以通过相关API直接访问账本，获取信息。

还可以通过智能合约发送events

---

system chaincode

运行在peer进程中

LSCC：lifecycle system chaincode

管理chaincode的生命周期

CSCC: configuration system chaincode

处理peer侧的channel配置

QSCC: query system chaincode

提供账本查询API

---

#### Gossip

* 管理peer discovery和channel membership

* 传递账本数据
* 对于新加入的peer，可以点对点快速同步数据



* leader peer

链接orderer，获取新的区块

将新的区块传递给组织内其他peer

在一个组织内可以有多个leader peer

* leader peer选举方式：

静态

动态





