### Fabric Explorer 搭建

* 环境：ubuntu
* Fabric浏览器版本：1.0
* 浏览器官方地址: [https://github.com/hyperledger/blockchain-explorer](https://github.com/hyperledger/blockchain-explorer)
___
### 准备
1. 确定搭建的Fabric网络版本
2. **clone对应的浏览的版本**
> 比如，1.4版本的Faric网络，就可以clone 1.0版本的Fabric explore
3. 确定**node版本**。如果版本不对，会出现许多未知错误。具体可参照官方github
4. 安装 postgresql
`sudo apt-get install postgresql`
5. 安装 jg
`sudo apt-get install jg`
6. 安装 docker
### 开始搭建
1. `git clone https://github.com/hyperledger/blockchain-explorer.git`
2. `cd blockchain-explorer`
3. 主要用到[v1.0.0-rc2](https://github.com/hyperledger/blockchain-explorer/blob/master/release_notes/v1.0.0-rc2.md)版本的浏览器以下几个配置文件: 
* appconfig.json
用于设置浏览器的IP和端口
* exploreconfig.json
用于设置数据库的相关信息
* first-network.json
用于设置证书相关信息
* config.json
config.json目前不需要过多关注，他内部引用的是first-network.json文件。
4. 设置first-network
(1) 把搭建Fabric网络时生成的crypto-config复制到blockchain-explorer目录下任意位置。
(2) 替换`organizations`和`peers`下的证书位置，最好使用全路径。使用全路径时，需要把`fullpath`设为`true`.
我的配置：
```json
{
	"name": "aberic",
	"version": "1.0.0",
	"license": "Apache-2.0",
	"client": {
		"tlsEnable": true,
		"adminUser": "admin",
		"adminPassword": "adminpw",
		"enableAuthentication": false,
		"organization": "Org1",
		"connection": {
			"timeout": {
				"peer": {
					"endorser": "300"
				},
				"orderer": "300"
			}
		}
	},
	"channels": {
		"mychannel": {
			"peers": {
				"peer0.org1.example.com": {}
			},
			"connection": {
				"timeout": {
					"peer": {
						"endorser": "6000",
						"eventHub": "6000",
						"eventReg": "6000"
					}
				}
			}
		}
	},
	"organizations": {
		"Org1MSP": {
			"mspid": "Org1MSP",
			"fullpath": true,
			"adminPrivateKey": {
				"path": "XXX/blockchain-explorer/app/platform/fabric/fixtures/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/0f7cc385f61b26515396a756b91ea2de980081dca57bcc375a33a5138979163c_sk"
			},
			"signedCert": {
				"path": "XXX/blockchain-explorer/app/platform/fabric/fixtures/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem"
			}
		}
	},
	"peers": {
		"peer0.org1.example.com": {
			"tlsCACerts": {
				"path": "XXX/blockchain-explorer/app/platform/fabric/fixtures/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt"
			},
			"url": "grpcs://XXX",
			"eventUrl": "grpcs://XXX",
			"grpcOptions": {
				"ssl-target-name-override": "peer0.org1.example.com"
			}
		}
	}
}
```
5. 设置 exploreconfig.json
这个配置可以使用默认配置。
6. 初始化数据库表
(1) `cd blockchain-explorer/app/persistence/fabric/postgreSQL/db`
(2) `./createdb.sh`
可能报错：
```shell
Copying ENV variables into temp file...
module.js:549
    throw err;
    ^

Error: Cannot find module '/root/blockchain-explorer/app/persistence/fabric/postgreSQL/db/processenv.js'
    at Function.Module._resolveFilename (module.js:547:15)
    at Function.Module._load (module.js:474:25)
    at Function.Module.runMain (module.js:693:10)
    at startup (bootstrap_node.js:191:16)
    at bootstrap_node.js:612:3
USER="hppoc"
DATABASE="fabricexplorer"
PASSWD='password'
rm: remove write-protected regular file '/tmp/process.env.json'? n
Executing SQL scripts, OS=linux-gnu
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = (unset),
        LC_ALL = (unset),
        LC_CTYPE = "UTF-8",
        LC_TERMINAL = "iTerm2",
        LC_TERMINAL_VERSION = "3.3.7",
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
could not change directory to "/root/blockchain-explorer/app/persistence/fabric/postgreSQL/db": Permission denied
./explorerpg.sql: No such file or directory
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = (unset),
        LC_ALL = (unset),
        LC_CTYPE = "UTF-8",
        LC_TERMINAL = "iTerm2",
        LC_TERMINAL_VERSION = "3.3.7",
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
could not change directory to "/root/blockchain-explorer/app/persistence/fabric/postgreSQL/db": Permission denied
./updatepg.sql: No such file or directory
```
解决方法：
* perl warining: `export LC_ALL=en_US.UTF-8`
* Permission denied:
`createdb.sh`会创建一个postgres的用户，并已这个用户初始化数据库表。如果你的当前用户不允许其他用户访问其下的数据，就会报这种错误。
比如：我当前用户root，到根目录下查看当前用户权限`cd \ && ll`.
```shell
drwx------  18 root root 4.0K Dec 18 07:57 root
```
用户权限是700，不允许同组和其他用户访问。
当我执行`./createdb.sh`时，在脚本内以用户postgres对root下的文件执行一些操作时，就会报错。
这个问题解决方法很多。

我的**解决方法**是：把blockchain-explorer项目移到根目录下。

再次执行`./createdb.sh`
当你看到以下句子时，说明你成功了。
> You are now connected to database XXX as user XXX.
7. 运行主目录下的 `./start.sh`
可能会出现以下错误：
 * FATAL: password authentication failed for user "
`logs/console/`下的日志文件也会出现postgres无法连接的错误。
**解决方法**：
修改`pg_hba.conf`配置文件,将第4个字段改为**trust**
```shell
# Database administrative login by Unix domain socket
local   all             postgres                                peer
```
为了避免麻烦，我将所有行的第4个字段都改成了 **trust**
最后执行`sudo /etc/init.d/postgresql reload`,重新加载配置文件。

* saveTransaction false 错误
这个可能是与数据库原来内容冲突，将数据库清空，重新启动；
**重新启动前，要用./stop.sh关闭浏览器后台进程**

* postgres无法远程链接

修改 `/etc/postgresql/10/main/postgresql.conf`添加`listen_addresses = '*'`



### node

全局安装n模块管理器(用于管理nodejs版本)

```undefined
sudo npm install n -g
```

n模块常用命令

```cpp
n //会列出所有安装的版本供你切换

n latest //安装最新版本

n stable //安装最新稳定版

n lts //安装最新长期支持版本

n rm [版本号] //删除某一版本

n -h //帮助命令
```

问题 n 模块切换无效（安装路径问题）

**（估计可能的原因时：node可能被nvm接管了）最有可能的情况就是，你的node的安装目录和 n 默认的路径不一样。
 查看 node 当前安装路径：**

```bash
$ which node
/opt/node/bin/node  #举个例子
```

**而 n 默认安装路径是 /usr/local，若你的 node 不是在此路径下，n 切换版本就不能把bin、lib、include、share 复制该路径中，所以我们必须通过N_PREFIX变量来修改 n 的默认node安装路径。**

**编辑环境配置文件**：

```undefined
vim ~/.bash_profile
```

**将下面两行代码插入到文件末尾**：

```bash
export NODE_HOME=/usr/local
export PATH=$NODE_HOME/bin:$PATH
export NODE_PATH=$NODE_HOME/lib/node_modules:$PATH
```

**执行source使修改生效。**

```bash
source ~/.bash_profile
```

n命令 键盘上下选择，回车确定，切换版本完成 升级npm版本



```kotlin
npm install -g npm
npm install -g npm@版本号
```

