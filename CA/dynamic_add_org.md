### 添加组织

1.  获取最新的配置块

2. 生成所需组织配置文件（手动）

   * crypto.yaml，用于生成key和证书

     ```shell
     cryptogen generate --config=./org-crypto.yaml
     ```

   * 将生成的配置转化为json，会用到configtx.yaml

     ```shell
     export FABRIC_CFG_PATH=$PWD && configtxgen -printOrg Org3MSP > org.json
     ```

3. 根据生成的配置文件构造相应对象

   ```json
   {
     "payload":{
       "header":{
         "channel_header":{
           "channel_id":"'$CHANNEL_NAME'",
           "type":2,
         }
       },
       "data":{
         "config_update":"$(cat org3_update.json)"
       }
     }
   }
   ```

   

4. 新组织的配置与旧配置组合生成新的pb格式的配置

5. 签名提交更新



### 添加peer

* CA client

1. 登记节点
2. 注册节点，会返回私钥和证书



---

### 手动添加peer

#### 第一步：生成private key以及对应的csr文件

在Openssl-Sign-New-Certs目录下：

1. 生成私钥

```
openssl ecparam -out ec256.pem -name prime256v1 -genkey
```

1. 私钥转换

```
openssl pkcs8 -topk8 -nocrypt -in ec256.pem -out ec256.key
cp ec256.key server_sk  #**注意**：此server_sk为私钥，需要妥善保管
```

1. 

```
openssl req -new -key ec256.pem -out server.csr -subj '/C=US/ST=California/L=San Francisco/CN=peer1.org1.example.com/O=new cert for peer1' -config ./client/req.cnf
```

当前目录下的server.csr文件是申请证书的请求文件，使用CA来颁发可信证书cert.pem（MSP证书），同样方式可以签发TLS证书。（查看：openssl req -in server.csr -noout -text）

#### 第二步：CA颁发的证书

1. 准备CA Server 进入目录：

```
cd /etc/pki/CA/private
```

复制org1 的root ca的私钥文件到当前目录，并命名为：cakey.pem

```
cp /home/sunshanlu/e2e_cli/crypto-config/peerOrganizations/org1.example.com/ca/*_sk ./cakey.pem  #根据实际情况更改路径
```

复制org1 的证书文件到上层目录，命名为cacert.pem

```
cp /home/sunshanlu/e2e_cli/crypto-config/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem ../cacert.pem  #根据实际情况更改路径
```

将第一步的server.csr文件上传到/etc/pki/CA/目录下 将[openssl.cnf](https://github.com/shanlusun/blockchain/blob/master/hyperledger-fabric/Remote-Network-Setup/Openssl-Sign-New-Certs/ca-server/openssl.cnf)复制到/etc/pki/CA/目录 创建所需文件：

```
touch index.txt serial
echo 1024 > serial
```

1. 查看申请证书的请求文件 在/etc/pki/CA/目录：

```
openssl req -in server.csr -noout -text
```

1. 签发证书 在Openssl-Sign-New-Certs目录下：

```
openssl ca -config ./ca-server/openssl.cnf -in server.csr -out server.crt -notext
```

但前目录的server.crt文件就是签发后的证书，供使用。（查看证书：openssl x509 -in server.crt -text）

#### 第三步：使用新颁发的server.crt证书和server_sk私钥

构建新peer的msp目录使用新证书和私钥，即可。