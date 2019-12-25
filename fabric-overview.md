 

ledger--账本：顾名思义，是交易的记录，交易在账本中是有序的，不可串改的。账本的改变，比如更新和删除，是由各个参与方调用智能合约完成的。

账本由两部分组成：区块链（blockchain）和状态数据库（世界状态）。

区块链是不可篡改的；

世界状态是K-V形式存储链交易日志，可改变的，他为chaincode提供了最新的KV值，使得调用chaincode时不必遍历全表。世界状态可以理解为一个中间状态。







交易

1. 客户端调用chaincode向peer发送交易提案
2. peer执行chaincode，返回给客户端背书提案响应
3. 应用会收集足够多的提案响应，将结果和背书打包为一笔交易。以便满足背书策略
4. 应用提交交易结果





system chain：初始化配置信息，如MSP，策略，还有配置细节。整个网络的任何改变都会生成一个配置区块添加到系统链上。