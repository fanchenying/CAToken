
##在线版本可以查询和执行协议#

https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts


学习一下：eth_sendTransaction    https://github.com/paritytech/parity/wiki/JSONRPC-eth-module#eth_sendtransaction

学习一下：Ethereum Contract ABI  
https://solidity.readthedocs.io/en/develop/abi-spec.html
https://github.com/ethereum/wiki/wiki/Ethereum-Contract-ABI



1. 服务上下载geth，安装和运行：
 XXXgeth --fast --networkid 4 --rpc --rpccorsdomain "http://localhost:3000" console

 XXXgeth --networkid 4 --rpc --rpccorsdomain "http://localhost:3000" --verbosity 1 console 2
 
 geth --rinkeby --rpc --rpccorsdomain "http://localhost:3000" --verbosity 1  console 


 macos #### 测试库   geth --rinkeby --rpc --rpcapi "eth,personal" --verbosity 1  console
 macos #### 真实库   geth --light --rpc --rpcapi "eth,personal" --verbosity 1 console
  
 win   ###  真实库   geth --datadir "D:\Ethereum" --rpc  console


win版本：
geth --light  --rpc  --rpc --rpccorsdomain "http://localhost:3000" console


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
5. curl -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"personal_newAccount","params":["Jess Call Come Very!"],"id":73}' http://127.0.0.1:8545 

