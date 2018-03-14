
##在线版本可以查询和执行协议#

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts


学习一下：eth_sendTransaction    https://github.com/paritytech/parity/wiki/JSONRPC-eth-module#eth_sendtransaction

学习一下：Ethereum Contract ABI  
https://solidity.readthedocs.io/en/develop/abi-spec.html
https://github.com/ethereum/wiki/wiki/Ethereum-Contract-ABI



1. 服务上下载geth，安装和运行：
 
 
 
 geth --rinkeby --rpc --rpccorsdomain "http://localhost:3000" --verbosity 1  console 


 macos #### 测试库   geth --rinkeby --rpc --rpcapi "eth,personal"  console
 macos #### 真实库   geth --light --rpc --rpcapi "eth,personal" --verbosity 1 console
  
 win   ###  真实库   geth --light  --rpc  --datadir "E:\Ethereum"   --rpcapi "eth,personal"  --verbosity 1 console console 


 


命令：模版 
curl -i -H 'Content-Type:application/json' -X POST --data '' http://127.0.0.1:8545 


2. curl -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' http://127.0.0.1:8545 


3. curl -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x12915932510edde2e7a91ebdd55d5c1981d16fb3", "latest"],"id":2}' http://127.0.0.1:8545 



web3.sha3('baz(uint32,bool)')
"cdcd77c0992ec5bbfc459984220f8c45084cc24d9b6efed1fae540db8de801d2"

web3.sha3('releasebyAdmin(address,uint256)')
"0xfe7ed06f2ed25ca2741cae24cb7e15ae86a69a817ca5a9c43ec85360dceedc20"
==>"0xfe7ed06f"

0xfe7ed06f
00000000000000000000000012915932510edde2e7a91ebdd55d5c1981d16fb3
00000000000000000000000000000000000000000000000000000000000f4240


4. curl -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":73}' http://127.0.0.1:8545 


rsync -avP --password-file=/etc/rsyncd/rsyncd.passwd rsync@121.32.236.120::VM/M/win2008x64dev /vm/M/  

建立账号
5. curl -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"personal_newAccount","params":["client2299"],"id":73}' http://127.0.0.1:8545 
curl -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"personal_unlockAccount","params":["0xe1a9f573fe051a58909ca9142ca325f94502a5c2","etheMagica12"],"id":73}' http://127.0.0.1:8545


6. 获取一个交易的收据--peding无效
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238"],"id":1}'

// Result
{
"id":1,
"jsonrpc":"2.0",
"result": {
     transactionHash: '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238',
     transactionIndex:  '0x1', // 1
     blockNumber: '0xb', // 11
     blockHash: '0xc6ef2fc5426d6ad6fd9e2a26abeab0aa2411b7ab17f30a99d3cb96aed1d1055b',
     cumulativeGasUsed: '0x33bc', // 13244
     gasUsed: '0x4dc', // 1244
     contractAddress: '0xb60e8dd61c5d32be8058bb8eb970870f07233155' // or null, if none was created
     logs: [{
         // logs as returned by getFilterLogs, etc.
     }, ...],
     logsBloom: "0x00...0" // 256 byte bloom filter
     status: '0x1'
  }
}