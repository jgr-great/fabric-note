### MSP

MSP是Membership Service Provider ——可插拔的接口，是Fabric权限管理的基石。它用于支持各种认证体系结构，MSP抽象提供：

* 具体的身份格式

* 用户证书验证

* 用户证书撤销
* 签名生成和验证

Fabric-CA 用于生成证书和密钥，以真正的初始化MSP。 Fabric-CA是用于身份管理的MSP接口的默认实现。

它通过列出成员的身份，或者通过识别哪些CA被授权派发证书，或者通过两者的组合，去识别哪些根CA或者中间CA是受信任的，进而可以定义一组受信任成员。

MSP出现在区块链网络中的两个位置：channel配置（channel MSP）和参与者的本地（本地MSP）。客户端（用户）和节点（peer和orderer）会定义本地MSP。节点本地MSP定义该节点的权限（例如，peer管理员是谁）。用户的本地MSP允许用户侧在其交易中作为channel的成员认证自身，或者作为特定角色的所有者在系统中进行认证。

每个节点和用户都必须定义一个本地MSP，因为它定义了谁在该级别具有管理或参与权限（peer管理员不一定是渠道管理员，反之亦然）。

channel MSP在channel层面定义了管理和参与权。参与channel的每个组织都必须为其定义MSP。channel上的所有参与者都可以得到这个channel的 MSP视图，因此可以正确地验证channel参与者。这意味着，如果组织希望加入该channel，则需要将包含该组织成员信任链的MSP纳入channel配置中。否则，将拒绝源自该组织身份的交易。

![img](https://raw.githubusercontent.com/jgr-great/fabric-note/master/image/membership.diagram.2.png)

观察上图，可以清楚的看到当安装并实例化智能合约时，本地MSP和channel MSP变化情况。ORG1和ORG2各自定义了本地MSP，在共享的channel C上也添加了自己的MSP。通过共识，每个组织也都有一份channel MSP的副本。

#### MSP级别

channel和本地MSP之间的分离反映了组织管理其本地资源（例如peer或orderer）及其channel资源的需求。将与网络管理问题相关MSP视为高级别，而较低级别的MSP处理私有资源管理。MSP在每个管理级别都是强制性的 - 必须为网络，channel，peer，orderer和用户定义MSP中的一种。

![img](https://raw.githubusercontent.com/jgr-great/fabric-note/master/image/membership.diagram.4.png) 

peer和orderer的MSP是本地的，而channel的MSP（包括网络配置）在该channel的所有参与者之间共享。在此图中，网络配置通道由ORG1管理，但另一个应用程序通道可由ORG1和ORG2管理。 peer P是ORG2的成员和管理者，而ORG1管理图的orderer O。ORG1和ORG2互相信任。管理者身份反映了谁可以管理这些组件。