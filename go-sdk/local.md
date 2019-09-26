

```go
//NewLocal returns a new local context
func NewLocal(clientProvider context.ClientProvider) (*Local, error)
// Local supplies the configuration and signing identity to
// clients that will be invoking the peer outside of a channel
// context using an identity in the peer's local MSP.
type Local struct {
	context.Client
	localDiscovery fab.DiscoveryService
}
```

