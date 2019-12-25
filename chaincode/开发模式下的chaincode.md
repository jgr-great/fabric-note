### Fabric Chaincode 源

chaincode的源可以在**core.yaml**文件中定义配置, **core.yaml**是peer的配置文件

默认使用Hyperledger官方的源，不同语言使用不同版本的源

```yaml
chaincode:
    id:
        path:
        name:
    # Generic builder environment, suitable for most chaincode types
    builder: $(DOCKER_NS)/fabric-ccenv:latest
    # Enables/disables force pulling of the base docker images (listed below)
    # during user chaincode instantiation.
    # Useful when using moving image tags (such as :latest)
    pull: false
    golang:
        # golang will never need more than baseos
        runtime: $(BASE_DOCKER_NS)/fabric-baseos:$(ARCH)-$(BASE_VERSION)
        # whether or not golang chaincode should be linked dynamically
        dynamicLink: false
    car:
        # car may need more facilities (JVM, etc) in the future as the catalog
        # of platforms are expanded.  For now, we can just use baseos
        runtime: $(BASE_DOCKER_NS)/fabric-baseos:$(ARCH)-$(BASE_VERSION)
    java:
        # This is an image based on java:openjdk-8 with addition compiler
        # tools added for java shim layer packaging.
        # This image is packed with shim layer libraries that are necessary
        # for Java chaincode runtime.
        runtime: $(DOCKER_NS)/fabric-javaenv:$(ARCH)-$(PROJECT_VERSION)
    node:
        # need node.js engine at runtime, currently available in baseimage
        # but not in baseos
        runtime: $(BASE_DOCKER_NS)/fabric-baseimage:$(ARCH)-$(BASE_VERSION)
```

chaincode的安装、实例化、升级等操作由系统chaincode LSCC（lifecycle system chaincode）管理。当LSCC收到 安装chaincode请求时，会解析chaincode包，并将chaincode包临时保存至本地。之后，调用docker client生成dockerfile、image。