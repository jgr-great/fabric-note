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
// Request contains the parameters to query and execute an invocation transaction
type Request struct {
	ChaincodeID  string
	Fcn          string
	Args         [][]byte
	TransientMap map[string][]byte

  // InvocationChain contains meta-data that's used by some Selection Service implementations
  // to choose endorsers that satisfy the endorsement policies of all chaincodes involved
  // in an invocation chain (i.e. for CC-to-CC invocations).
  // Each chaincode may also be associated with a set of private data collection names
  // which are used by some Selection Services (e.g. Fabric Selection) to exclude endorsers
  // that do NOT have read access to the collections.
  // The invoked chaincode (specified by ChaincodeID) may optionally be added to the invocation
  // chain along with any collections, otherwise it may be omitted.
	InvocationChain []*fab.ChaincodeCall
}

//Response contains response parameters for query and execute an invocation transaction
type Response struct {
	Proposal         *fab.TransactionProposal
	Responses        []*fab.TransactionProposalResponse
	TransactionID    fab.TransactionID
	TxValidationCode pb.TxValidationCode
	ChaincodeStatus  int32
	Payload          []byte
}
```



### Example

```go
//ChannelContext creates and returns channel context
func (sdk *FabricSDK) ChannelContext(channelID string, options ...ContextOption) contextApi.ChannelProvider 
```



* 实例化

```go
import(
	"github.com/hyperledger/fabric-sdk-go/pkg/fabsdk"
  "github.com/hyperledger/fabric-sdk-go/pkg/client/channel"
)

// get channel context
// sdk: FabricSDK handler
// AnchorOrg: define in config
clientContext := sdk.ChannelContext(ChannelID, 
                                    fabsdk.WithUser("Admin"), 
                                    fabsdk.WithOrg(AnchorOrg),
                                   )
chClient, err := channel.New(clientContext)
```

* chaincode 查询（query）

```go
var args []string
args = append(args, "query")
// name is a param 
args = append(args, name)
req := channel.Request{
		ChaincodeID: util.ChainCodeID,
		Args:        [][]byte{[]byte(args[1])},
		Fcn:         args[0],
	}

// local need instantiate
peers, err := local.LocalDiscoveryService().GetPeers()
response, err := chClient.Query(req, channel.WithTargets(peers[0]))
```

* chaincode 调用（invoke）

```go
req := channel.Request{
		ChaincodeID: ChainCodeID,
  	// chancode method
		Fcn:         "invoke",
  	// args what the method need
		Args:        [][]byte{[]byte("a"), []byte("b"), []byte("-20")},
	}
	response, err := util.client.Execute(req)
```

* chaincode 调用之event

需要用的 API

```go
// RegisterChaincodeEvent registers for chaincode events. Unregister must be called when the registration is no longer needed.
//  Parameters:
//  ccID is the chaincode ID for which events are to be received
//  eventFilter is the chaincode event filter (regular expression) for which events are to be received
//
//  Returns:
//  the registration and a channel that is used to receive events. The channel is closed when Unregister is called.
func (c *Client) RegisterChaincodeEvent(ccID, eventFilter string) (fab.Registration, <-chan *fab.CCEvent, error)
```

作用：SDK能够接收到该事件的状态信息

在chaincode内*set event*，eventID可以自定义

```go
// Transaction makes payment of X units from A to B
func (t *SimpleChaincode) invoke(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	...
  err = stub.SetEvent("eventID", []byte{})
 	...
}
```

在SDK调用chaincode

```go
// register event
// eventID should be same with that in chaincide
reg, notifier, err := util.event.RegisterChaincodeEvent(ChainCodeID, eventID)
if err != nil {
 	...
}
defer util.event.Unregister(reg)

// SDK invoke chaincode through channel
req := channel.Request{
		ChaincodeID: 	util.ChainCodeID,
		Fcn:         	"invoke",
  	Args: 				[][]byte{}
	}
response, err := chclient.Execute(req)

if response.TransactionID == "" {
  return errors.New("TransactionID is empty")
}

//Wait for the result of the submission
select {
  case ccEvent := <-notifier:
  fmt.Printf("Received CC event: %v\n", ccEvent)
  case <-time.After(time.Second * 200):
  fmt.Errorf("did not receive CC event for eventId (%s)", eventID)
  return ""
}
```



