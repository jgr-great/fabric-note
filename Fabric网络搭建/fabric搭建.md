

## Build Fabric Network

### 重点关注

* 带有路径的配置项

* 证书配置项

* ORE_PEER_LOCALMSPID=Org[*组织序号*]MSP

  > docker-peer0org[index].yaml



### 机器角色：

| 内网 | 角色                                                         |
| ---- | ------------------------------------------------------------ |
| A    | zookeeper1,  kafka1,  orderer0.example.com,  peer0.org1.example.com |
| B    | zookeeper2,  kafka2,  orderer1.example.com,  peer0.org2.example.com |
| C    | zookeeper3,  kafka3,  orderer2.example.com,  peer0.org3.example.com |

### chaincode命令：  
```shell
都要指定 -o 否则会报错   
create 创建账户 peer chaincode invoke -n txcc -C mychannel -c '{"Args":["create","name","value"]}' -o orderer0.example.com:7050
invoke 执行交易 `peer chaincode invoke -n txcc -C mychannel -c '{"Args":["invoke","name1","name2","value"]}' -o orderer0.example.com:7050
delete 删除账户 `peer chaincode invoke -n txcc -C mychannel -c '{"Args":["delete","name"]}' -o orderer0.example.com:7050 
query  查询账户 `peer chaincode query -n txcc -C mychannel -c '{"Args":["query","butters"]}' -o orderer0.example.com:7050
```

  

> 进入机器 A
> 切换到 root 权限: 
>     sudo su -

### 安装 go 环境: 
1. `wget https://studygolang.com/dl/golang/go1.11.linux-amd64.tar.gz`
2. `tar -zxvf go1.11.linux-amd64.tar.gz -C /usr/lib`
3. 设置添加环境变量 vi /etc/profile 在最后面添加如下配置:
```bash
  export GOPATH=/opt/gopath
	export GOROOT=/usr/lib/go
	export GOARCH=386
	export GOOS=linux
	export GOTOOLS=$GOROOT/pkg/tool
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```
4. `source /etc/profile`
5. `go version`

### 安装 docker 及 docker-compose
* docker:
  [参考链接](https://docs.docker.com/v17.09/engine/installation/)

```
1. apt-get update
2. apt-get -y install apt-transport-https ca-certificates curl software-properties-common
3. curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
4. add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
5. apt-get -y update
6. apt-get -y install docker-ce
7. docker version
```
* docker-compose
  [参考链接](https://docs.docker.com/compose/install/)

```
1. curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
2. chmod +x /usr/local/bin/docker-compose
3. docker-compose --version
```

### 下载 fabric 项目
```
1. mkdir -p /opt/gopath/src/github.com/hyperledger
2. 到 hyperledger 目录下 clone 项目
	git clone https://github.com/hyperledger/fabric.git
3. 切换分支
	git checkout v1.3.0
4. 执行脚本下载镜像
    fabric/examples/e2e_cli
    chmod +x download-dockerimages.sh
	./download-dockerimages.sh
5. 在 fabric 目录下创建 aberic 目录,作为我们的启动目录
    mkdir aberic
```

#### 已下在 A主机下运行    
1. 下载1.3版本所需的二进制文件
https://nexus.hyperledger.org/content/repositories/releases/org/hyperledger/fabric/hyperledger-fabric/linux-amd64-1.3.0/hyperledger-fabric-linux-amd64-1.3.0.tar.gz
2. cd 到根目录
3. 下载并解压 解压出 /bin/ 和 /config/ 两个目录
```
wget https://nexus.hyperledger.org/content/repositories/releases/org/hyperledger/fabric/hyperledger-fabric/linux-amd64-1.3.0/hyperledger-fabric-linux-amd64-1.3.0.tar.gz
tar -zxvf hyperledger-fabric-linux-amd64-1.3.0.tar.gz
```
4. 将 /bin/ 文件夹拷贝到 aberic 目录下

* crypto-config.yaml 配置 

	在 aberic 下建立 crypto-config.yaml,  生成节点所需配置文件: 


 `./bin/cryptogen generate --config=./crypto-config.yaml` 

> 运行完多了个 crypto-config 文件夹

* configtx.yaml 配置 
    在 aberic 下建立 configtx.yaml, 参照源码 examples/e2e_cli/configtx.yaml, 进行更改, 生成创世区块及设定 Fabric 网络启动类型: 
    
* 生成创世块文件:
  
```bash
mkdir channel-artifacts 
./bin/configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block
```
* 创世区块 genesis.block 是为了 Orderer 排序服务启动时用到, Peer 节点在启动后需要创建的 Channel 的配置文件在这里也一并生成:  

```bash
./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/mychannel.tx -channelID mychannel
```

* 将生成的 channel-artifacts  crypto-config 两个文件夹，拷贝到其他2台机器的 aberic 目录

### Zookeeper 配置 (3个zookeeper)

	创建 docker-zookeeper1.yaml docker-zookeeper2.yaml docker-zookeeper3.yaml 文件
	将 zk2.yaml 文件复制到相应的 zk2 节点 aberic 文件夹
	将 zk3.yaml 文件复制到相应的 zk3 节点 aberic 文件夹

### Kafka 配置 (3个kafka)
	创建 docker-kafka1.yaml docker-kafka2.yaml docker-kafka3.yaml docker-kafka4.yaml 文件
	将 kfk2.yaml 文件复制到相应的 kfk2 节点 aberic 文件夹
	将 kfk3.yaml 文件复制到相应的 kfk3 节点 aberic 文件夹
	将 kfk4.yaml 文件复制到相应的 kfk4 节点 aberic 文件夹

### Order 配置 (3个order)
	创建 docker-orderer0.yaml docker-orderer1.yaml docker-orderer2.yaml 文件
	将 orderer1.yaml 文件复制到相应的 orderer1 节点 aberic 文件夹
	将 orderer2.yaml 文件复制到相应的 orderer2 节点 aberic 文件夹



### 启动 Zookeeper 集群
	- zookeeper1:
		docker-compose -f docker-zookeeper1.yaml up -d           # 这里没有加 -d, 是为了看启动日志
	- "zookeeper2:
		docker-compose -f docker-zookeeper2.yaml up -d
	- zookeeper3:
		docker-compose -f docker-zookeeper3.yaml up -d

### 启动 Kafka 集群
	- kafka1:
		docker-compose -f docker-kafka1.yaml up -d
	- kafka2:
		docker-compose -f docker-kafka2.yaml up -d
	- kafka3:
		docker-compose -f docker-kafka3.yaml up -d


### 启动 Order 集群
	- orderer0:
		docker-compose -f docker-orderer0.yaml up -d
	- orderer1:
		docker-compose -f docker-orderer1.yaml up -d
	- orderer2:
		docker-compose -f docker-orderer2.yaml up -d


## 集群环境测试
Peer 节点的交互止步于 Orderer 排序服务节点, 并不关注顶层建设是 Solo 还是 Kafka。
在四台机器先创建好 fabric/examples/chaincode/go/transaction/transaction.go 文件, 这是演示的 chaincode 代码。

* 在 **服务器A**上创建 peer0.org1 节点: 
1. 在 aberic 下创建 **docker-peer0org1.yaml** 文件, 并启动:

```bash
export CA_PKEY=$(cd $PWD/crypto-config/peerOrganizations/org[index].example.com/ca && ls *_sk)
echo $CA_PKEY
docker-compose -f docker-peer0org1.yaml up -d  
```

2. 进入 cli:  
`docker exec -it cli /bin/bash`
3. 创建 channel:

```bash
peer channel create -o orderer0.example.com:7050  -c mychannel -f ./channel-artifacts/mychannel.tx  --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
```

> 这里会生成个 mychannel.block 文件 会有用

4. 创建成功后加入到该频道:

```bash
 peer channel join -b mychannel.block
 peer channel list
```

5. 安装智能合约:

```bash
export CC_SRC_PATH=github.com/hyperledger/fabric/examples/chaincode/go/example02/cmd
peer chaincode install -n txcc -v 1.0 -p ${CC_SRC_PATH}

# 查看是否安装成功
peer chaincode list -C mychannel --installed
```



* 之前直接导入example/，实例化智能合约的时候总是报错，

```log
Error: could not assemble transaction, err proposal response was not successful, error code 500, msg error starting container: error starting container: API error (400): OCI runtime create failed: container_linux.go:345: starting container process caused "exec: \"chaincode\": executable file not found in $PATH": unknown
```



* **导入智能合约时必须包含main文件**


6 实例化智能合约: 只需要实例化一次，其他节点只需要安装，不用再实例化

```bash
# 开启tls条件下
peer chaincode instantiate -o orderer0.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -n txcc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -C mychannel -P "OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')"

# 关闭tls条件下
peer chaincode instantiate -o orderer0.example.com:7050 -n txcc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}' -C mychannel -P " OR ('Org1MSP.peer','Org2MSP.peer','Org3MSP.peer')"

# 查看是否初始化成功
peer chaincode list -C mychannel --instantiated
```

7 调用智能合约:
```bash
# 开启tls条件下
peer chaincode invoke -o orderer0.example.com:7050 \
--tls true \
--cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
-C mychannel \
-n txcc \
--peerAddresses peer0.org1.example.com:7051 \
--tlsRootCertFiles \
/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
-c '{"Args":["invoke","a","b","10"]}'

# 关闭tls条件下 
peer chaincode invoke -o orderer0.example.com:7050 \
-C mychannel \
-n txcc \
--peerAddresses peer0.org1.example.com:7051 \
--tlsRootCertFiles \
/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
-c '{"Args":["invoke","a","b","10"]}'
```

### 在 服务器B上创建 peer0.org2 节点:

> 服务器C与服务器B操作相似，只需修改相关配置

这里要将服务器A产生的 mychannel.tx 通过 docker cp 拷贝到这台机器的 cli 容器上的 fabric/peer 目录下，目的是加入到 channel

**加入channel**:  

``` bash
peer channel join -b mychannel.block 
```
**安装链码**:
```bash
peer chaincode install -n marbles02 -p github.com/hyperledger/fabric/examples/chaincode/go/transaction -v 1.0
```

**调用查询**:

``` bash
peer chaincode query -n marbles02 -c  '{"Args":["readMarble","marble1"]}' -C mychannel
```

> 其他两个节点同理

### 升级 chaincode
```bash
peer chaincode install -n txcc -p github.com/hyperledger/fabric/examples/chaincode/go/transaction -v 2.0

peer chaincode upgrade -o orderer0.example.com:7050 -n txcc -v 2.0 -c '{"Args":[]}' -C mychannel -P "AND ('Org2MSP.member','Org3MSP.member','Org4MSP.member')"
```
背书策略等同于："OutOf(3,'Org2MSP.member','Org3MSP.member','Org4MSP.member')"

* 升级之后，其他几点只需要安装新的智能合约版本
```bash
peer chaincode install -n txcc -p github.com/hyperledger/fabric/examples/chaincode/go/transaction -v 2.0

peer channel create -o orderer0.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer chaincode invoke -o orderer0.example.com:7050 -C mychannel -n txcc -c '{"Args":["create","butters","5000"]}' 

peer chaincode invoke -o orderer0.example.com:7050 -C mychannel -n txcc --peerAddresses peer0.org1.example.com:7051 --peerAddresses peer0.org2.example.com:7051 -c '{"Args":["create","ddd","5000"]}
```



## 问题

3个组织的orderer无法通信

```verilog
2019-09-25 02:04:42.519 UTC [cauthdsl] deduplicate -> ERRO 991f Principal deserialization failure (the supplied identity is not valid: x509: certificate signed by unknown authority) for identity 0
```

* CORE_PEER_LOCALMSPID 设置错误



#### 网上其他问题

```verilog
Error: error getting endorser client for channel: endorser client failed to connect to orderer.rabbit.com:8051: failed to create new connection: context deadline exceeded
```

原因：CORE_PEER_ADDRESS=orderer.rabbit.com:8051 地址不对或peer节点未启动

***

```verilog
Error: proposal failed (err: bad proposal response 500: access denied for [JoinChain][testc2]: [Failed verifying that proposal's creator satisfies local MSP principal during channelless check policy with policy [Admins]: [This identity is not an admin]])
```

原因：CORE_PEER_MSPCONFIGPATH=crypto-config/peerOrganizations/[org1.example.com/users/Admin@org1.example.com/msp](https://links.jianshu.com/go?to=http%3A%2F%2Forg1.example.com%2Fusers%2FAdmin%40org1.example.com%2Fmsp) msp地址未设置，或设置的地址不是admin

***

```verilog
Error: failed to create deliver client: orderer client failed to connect to 192.168.127.129:7050: failed to create new connection: context deadline exceeded
```

原因：orderer节点地址不对，或orderer节点未启动

***

```verilog
Error: got unexpected status: BAD_REQUEST -- error authorizing update: error validating ReadSet: readset expected key [Group] /Channel/Application at version 0, but got version 1
```

原因：通道已创建

***

```verilog
got unexpected status: BAD_REQUEST -- error authorizing update: error validating DeltaSet: policy for [Group] /Channel/Application not satisfied: Failed to reach implicit threshold of 1 sub-policies, required 1 remaining
```

原因：通常表示频道创建事务的签名者没有其中一个联盟组织的管理员权限
最常见的原因是：
a) 该身份不在组织的管理员列表中。
b) 组织证书未由组织CA链有效签署。
c) 订货人不知道身份的组织。

其他一些不太可能的可能性因为您使用的是对等二进制而不是自定义代码
a) 签名与标识或有符号字节不匹配。
b) 身份是畸形的。

***

```verilog
Cannot run peer because error when setting up MSP of type bccsp from directory /home/wff/jaderabbit/echain1/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp: could not initialize BCCSP Factories: Failed initializing BCCSP.: Could not initialize BCCSP SW [Failed to initialize software key store: An invalid KeyStore path provided. Path cannot be an empty string.] Could not find default SW BCCSP
```

原因：老版viper不会报错，这是由于你是用的最新版本的viper。如果你一定要使用最新版本的viper（我也想用），这里也可以提供一个不太正式的修改方案。
新版viper修改方法：github.com/hyperledger/fabric/peer/common/common.go

***

```verilog
resource temporarily unavailable
```

原因：打开了相同的leveldb

***

```verilog
error getting default signer: error obtaining the default signing identity: this MSP does not possess a valid default signing identity
```

原因：未初始化MSP，可以试试调用这个命令进行初始化

***

```verilog
proposal failed (err: bad proposal response 500: cannot create ledger from genesis block: LedgerID already exists)
```

原因：重复加入channel

***

```verilog
error getting endorser and deliver clients: no endorser clients retrieved - this might indicate a bug
```

获取endorser客户端时，peerAddresses是空数组，须是元素为空串，长度为1的数组

***

```verilog
Bad configuration detected: Received AliveMessage from a peer with the same PKI-ID as myself: tag:EMPTY alive_msg:<membership:<pki_id:"\206\0367dH\361\312\347\300l\035@1v\356\030\003\233*\355\241\234\262zf\352\264\367w\007\302\226" > timestamp:<inc_num:1554097615134317977 seq_num:539 > >
```

使用了相同的msp证书

***

```verilog
error: chaincode fingerprint mismatch: data mismatch
```

安装链代码时，基本流程的工作方式如下：

1. 考虑到包括传递在内的所有依赖关系，它被打包到存档文件中
2. 使用golang环境在docker容器内复制并在那里编译
3. 如果我没有弄错，下一个peer会建立新的chaincode容器并移动已编译的二进制文件 /usr/bin/local/chaincode
   现在，问题在于$GOPATH您的计算机中很可能存在差异，因此在不同的计算机上安装相同的链代码会带来不同的依赖关系，最终会产生不同的手指结果。
   您需要做的是将您的链代码打包在一个地方并分发包以安装它。

***

```verilog
 Got error while committing(unexpected Previous block hash. Expected PreviousHash =
```

通道创始块配置文件和orderer里的创始块配置不匹配

***

```verilog
error: Error constructing Docker VM Name. 'dev1-trembling--human--rabbit_02-1.0-f21065c44f48dc8183241105b2a4dac241d062f17f6678c851c9d6989df58c71' breaks Docker's repository naming rules
```

core.yaml中的peer.id有特殊字符

***

```
Error: error endorsing chaincode: rpc error: code = Unknown desc = access denied: channel [syschannel] creator org [Org1MSP]
```

没加入syschannel通道

***

```verilog
error Entry not found in index
```


查询的数据不存在。最直观的可能就是你所查询的数据是脏数据，源数据已经被清除，再查询时，就会报这个错误