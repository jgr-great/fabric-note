有关块大小的信息在config.tx中设置。

config.tx用于生成创世区块genesis.block

```yaml
# 控制块里的消息数量
BatchSize:
	# 块里的最大消息数为 10
	MaxMessageCount: 10
	# 块内消息总大小最大为 100MB
	AbsoluteMaxBytes: 100MB
	# 最合适的出块大小
	# 比如当前情况下，如果一笔交易200kB
	# 那么两笔交易就会出一个块
	PreferredMaxBytes: 512k
```



* Example：

假设 PreferredMaxBytes 是 512 KB，MaxMessageCount 是 30。

流水线上来了以下消息（交易） 25笔 10KB/每条 的，1笔600KB的，2笔200KB/每条的，60笔2KB/每条的。

1、当碰到1笔600KB的时候，将前面的 25笔 10KB/每条 打包成一个箱子（块）（共250KB，25条交易）；

2、那笔 600KB（大于 PreferredMaxBytes ）的，单独装箱成一个块（共600KB，1条交易）；

3、那两笔 200KB 的，再加上后面的 28笔2KB的，装箱成一个块（共 456KB，30条交易，大于等于了 MaxMessageCount ）