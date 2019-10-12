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



### config.FromFile

1. NewBackend

   1) 创建viper实例

   2) 生成一个备份配置`defConfigBackend`

   在初始化options时，将`envPrefix`初始化为*"FABRIC_SDK"*,   **不知道有什么用**

   ```go
   // defConfigBackend represents the default config backend
   type defConfigBackend struct {
   	configViper *viper.Viper
   	opts        options
   }
   
   // what to do
   type options struct {
   	envPrefix    string
   	templatePath string
   }
   ```

   

   3) 读取模板（默认）配置

2. 设置viper配置文件路径
3. 设置日志级别
4. 返回core.ConfigProvider

```go
//ConfigProvider provides config backend for SDK
type ConfigProvider func() ([]ConfigBackend, error)

//ConfigBackend backend for all config types in SDK
type ConfigBackend interface {
	Lookup(key string) (interface{}, bool)
}
```

### fabsdk.New

1. 初始化 `defPkgSuite`

```go
type defPkgSuite struct{}

func (ps *defPkgSuite) Core() (sdkApi.CoreProviderFactory, error) {
	return defcore.NewProviderFactory(), nil
}

func (ps *defPkgSuite) MSP() (sdkApi.MSPProviderFactory, error) {
	return defmsp.NewProviderFactory(), nil
}

func (ps *defPkgSuite) Service() (sdkApi.ServiceProviderFactory, error) {
	return defsvc.NewProviderFactory(), nil
}

func (ps *defPkgSuite) Logger() (api.LoggerProvider, error) {
	return modlog.LoggerProvider(), nil
}
```



2. 调用 `fromPkgSuite`

```go
// fromPkgSuite creates an SDK based on the implementations in the provided pkg suite.
// TODO: For now leaving this method as private until we have more usage.
func fromPkgSuite(configProvider core.ConfigProvider, pkgSuite pkgSuite, opts ...Option) (*FabricSDK, error)
```

初始化 `FabricSDK`结构体

```go
/ FabricSDK provides access (and context) to clients being managed by the SDK.
type FabricSDK struct {
	opts          options
	provider      *context.Provider
	cryptoSuite   core.CryptoSuite
	system        *operations.System
	clientMetrics *metrics.ClientMetrics
}

type configs struct {
	cryptoSuiteConfig core.CryptoSuiteConfig
	endpointConfig    fab.EndpointConfig
	identityConfig    msp.IdentityConfig
	metricsConfig     metricsCfg.MetricsConfig
}

type options struct {
	Core              sdkApi.CoreProviderFactory
	MSP               sdkApi.MSPProviderFactory
	Service           sdkApi.ServiceProviderFactory
	Logger            api.LoggerProvider
	CryptoSuiteConfig core.CryptoSuiteConfig
	endpointConfig    fab.EndpointConfig
	IdentityConfig    msp.IdentityConfig
	ConfigBackend     []core.ConfigBackend
  // Provider options are passed along to the various providers
	ProviderOpts      []coptions.Opt 
	metricsConfig     metricsCfg.MetricsConfig
}

// Option configures the SDK.
type Option func(opts *options) error
```



3. 在`fromPkgSuite`函数内`initSDK`

   1) 初始化日志

   2) 加载配置

   * `loadCryptoConfig()`
   * `loadEndpointConfig()`
   * `loadIdentityConfig()`
   * `loadMetricsConfig()`

   根据之前设置的配置文件，各个模块分别把配置做一个备份，检查相关模块的配置接口是否全部实现，没有实现的接口则使用默认实现。

   * 实例化`configs`,并返回

   3) 初始化rand

   4) Initialize state store

   5) Initialize Signing Manager

   6) Initialize IdentityManagerProvider

   7) Initialize Fabric provider

   8) Initialize local discovery provider

   9) initMetrics
   
   10) update sdk providers list since all required providers are initialized
   
   11) initialize