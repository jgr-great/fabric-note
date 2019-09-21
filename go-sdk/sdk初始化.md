```golang
// "github.com/hyperledger/fabric-sdk-go/pkg/core/config"
// 
func FromFile(name string, opts ...Option) core.ConfigProvider{
	......
}

// "github.com/hyperledger/fabric-sdk-go/pkg/fabsdk"
func New(configProvider core.ConfigProvider, opts ...Option) (*FabricSDK, error) {
	pkgSuite := defPkgSuite{}
	return fromPkgSuite(configProvider, &pkgSuite, opts...)
}
```



