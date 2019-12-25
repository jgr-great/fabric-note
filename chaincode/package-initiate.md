

```go
var Version = "latest"
var CommitSHA = "development build"
var BaseDockerLabel = "org.hyperledger.fabric"
var DockerNamespace = "hyperledger"
var BaseDockerNamespace = "hyperledger"
```



1. 获取路径下所有文件路径，构造descriptors
2. 生成tar包，bytes类型
3. 构造CCPackage

### lscc Install

1. 解析打包数据
2. 将chaincode临时存储到本地
3. 得到ccid
4. 得到build status，反应ccid对应的chaincode是否在等在build
5. 等待完成build
6. 得到包含release版的元数据tar包



#### build chaincode

1. 通过ccid得到chaincode的元数据
2. 调用外部build工具
3. 如果外部build工具build失败，调用docker builder

* External builder

1. 外部没有builder直接返回
2. build image

* Docker builder

生成dockerfile，

build image

1) 生成唯一镜像名字

2) 从dockerfile生成image





* External builder

1. 外部没有定义builder（编译器）直接返回
2. 查看缓存中是否有已经build好的的chaincode
3. 如果有的话，直接返回这个实例
4. 创建build上下文，BuildContext本地有关chaincode包的各种文件的引用
   * 生成一个临时目录
   * 将chaincode解压到目标目录