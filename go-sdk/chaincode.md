# Chaincode

需要**resmgmt**包内的一些API

```go
// NewCCPackage creates new go lang chaincode package
// [chaincodePath] should be like github.com/...
// [goPath] should be GOPATH
func NewCCPackage(chaincodePath string, goPath string) (*resource.CCPackage, error) 

// InstallCC allows administrators to install chaincode onto the filesystem of a peer.
// If peer(s) are not specified in options it will default to all peers that belong to admin's MSP.
//  Parameters:
//  req holds info about mandatory chaincode name, path, version and policy
//  options holds optional request options
//
//  Returns:
//  install chaincode proposal responses from peer(s)
func (rc *Client) InstallCC(req InstallCCRequest, options ...RequestOption) ([]InstallCCResponse, error)

// it belong to resmgmt pkg
// WithRetry sets retry options.
func WithRetry(retryOpt retry.Opts) RequestOption
// InstantiateCC instantiates chaincode with optional custom options (specific peers, filtered peers, timeout). If peer(s) are not specified
// in options it will default to all channel peers.
//  Parameters:
//  channel is manadatory channel name
//  req holds info about mandatory chaincode name, path, version and policy
//  options holds optional request options
//
//  Returns:
//  instantiate chaincode response with transaction ID
func (rc *Client) InstantiateCC(channelID string, req InstantiateCCRequest, options ...RequestOption) (InstantiateCCResponse, error)
// UpgradeCC upgrades chaincode with optional custom options (specific peers, filtered peers, timeout). If peer(s) are not specified in options
// it will default to all channel peers.
//  Parameters:
//  channel is manadatory channel name
//  req holds info about mandatory chaincode name, path, version and policy
//  options holds optional request options
//
//  Returns:
//  upgrade chaincode response with transaction ID
func (rc *Client) UpgradeCC(channelID string, req UpgradeCCRequest, options ...RequestOption) (UpgradeCCResponse, error)
```





## 安装 Chaincode

```go
// ChaincodePath should be like github.com/...
// ChaincodeGoPath is same as GOPATH
ccPkg, err := packager.NewCCPackage(ChaincodePath, ChaincodeGoPath)

// InstallCC example cc to org peers
	installCCReq := resmgmt.InstallCCRequest{
		Name:    ChainCodeID,
		Path:    ChaincodePath,
		Version: version,
		Package: ccPkg,
	}
// if you have 
resmgmtClient.InstallCC(installCCReq, resmgmt.WithRetry(retry.DefaultResMgmtOpts))
```





## 实例化 Chaincode

```go
instantiateCCReq := resmgmt.InstantiateCCRequest{
		Name:    "txcc2",
		Path:    ChaincodeGoPath,
		Version: version,
		Args:    [][]byte{[]byte("init")},
		Policy:  ccPolicy,
	}

resp, err := resmgmtClient.InstantiateCC(util.ChannelID, instantiateCCReq)
```





## 升级 Chaincode

```go
// policyStr string
ccPolicy, err := cauthdsl.FromString(policyStr)

upgradeCCReq := resmgmt.UpgradeCCRequest{
  Name:    util.ChainCodeID,
  Path:    util.ChaincodeGoPath,
  Version: version,
  Args:    [][]byte{[]byte("init")},
  Policy:  ccPolicy,
}

resp, err := resmgmtClient.UpgradeCC(ChannelID, upgradeCCReq)
```

