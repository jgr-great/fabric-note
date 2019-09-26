resmgmt支持在Fabric网络上创建和更新资源。resmgmt允许管理员创建、更新通道，并允许Peer节点加入通道。管理员还可以在Peer节点上执行与链码相关的操作，例如安装，实例化和升级链码。

resmgmt使用基本流程如下：
1. 准备客户端上下文
2. 创建资源管理客户端
3. 创建新通道
4. 将Peer节点加入通道
5. 将chaincode安装到Peer节点的文件系统
6. 在通道上实例化chaincode
7. 查询通道上的Peer节点，已安装/实例化的chaincode等



```go
//Context creates and returns context client which has all the necessary providers
// 返回所有必须provider
func (sdk *FabricSDK) Context(options ...ContextOption) contextApi.ClientProvider
// WithUser uses the named user to load the identity
func WithUser(username string) ContextOption 
// WithOrg uses the named organization
func WithOrg(org string) ContextOption 
```



* 查询chaincode API

```go
// QueryInstalledChaincodes queries the installed chaincodes on a peer.
//  Parameters:
//  options hold optional request options
//  Note: One target(peer) has to be specified using either WithTargetURLs or WithTargets request option
//
//  Returns:
//  list of installed chaincodes on specified peer
func (rc *Client) QueryInstalledChaincodes(options ...RequestOption) (*pb.ChaincodeQueryResponse, error)

// QueryInstantiatedChaincodes queries the instantiated chaincodes on a peer for specific channel. If peer is not specified in options it will query random peer on this channel.
//  Parameters:
//  channel is manadatory channel name
//  options hold optional request options
//
//  Returns:
//  list of instantiated chaincodes
func (rc *Client) QueryInstantiatedChaincodes(channelID string, options ...RequestOption) (*pb.ChaincodeQueryResponse, error) 
```



***



* 初始化

  > [local](../local.md)

```go
// orgAdmin:组织成员-管理员
// orgName: 组织名字
clientProvider = sdk.Context(fabsdk.WithUser(orgAdmin), fabsdk.WithOrg(orgName))

resmgmtClient = resmgmt.New(clientProvider)
local, err := context.NewLocal(clientProvider)
```

* 查询已安装的chaincode

```go
// find all eligible peers on some channel
peers, err := local.LocalDiscoveryService().GetPeers()
option := resmgmt.WithTargets(peers[0])
resmgmtClient.QueryInstalledChaincodes(option)
```

* 查询已实例化的chaincode

```go
resmgmtClient.QueryInstantiatedChaincodes(ChannelID, option)
```

