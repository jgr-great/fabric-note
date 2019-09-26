# Channel 

channel 包对Fabric网络上的channel访问提供了支持，在一个特定channel上，一个channel实例与peer们交互；还可以对chaincode进行查询、执行、注册或注销。

如果App想要与多个channel进行交互，应该分别创建每个channel的实例。

基本流程：

1. 准备创建channel的context
2. 生成channel实例
3. 执行、查询chaincode



```go
// New returns a Client instance. Channel client can query chaincode, execute chaincode and register/unregister for chaincode events on specific channel.
func New(channelProvider context.ChannelProvider, opts ...ClientOption) (*Client, error) 
```



```go
// sdk: FabricSDK实例
// AnchorOrg: 配置文件定义的
sdk.ChannelContext(ChannelID, fabsdk.WithUser("Admin"), fabsdk.WithOrg(AnchorOrg))
chClient, err := channel.New(clientContext)
```



