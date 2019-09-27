### API

```go
// 
func FromFile(name string, opts ...Option) core.ConfigProvider

//
func New(configProvider core.ConfigProvider, opts ...Option) (*FabricSDK, error) {
	pkgSuite := defPkgSuite{}
	return fromPkgSuite(configProvider, &pkgSuite, opts...)
}
```

### 初始化SDK

```go
import(
	"github.com/hyperledger/fabric-sdk-go/pkg/core/config"
	"github.com/hyperledger/fabric-sdk-go/pkg/fabsdk"
)
// ConfigPath: 配置文件路径
sdk, err := fabsdk.New(config.FromFile(ConfigPath))
```

