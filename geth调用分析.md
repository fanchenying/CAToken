
1. 开启服务  geth --rpc console 

2. 解锁账户  personal.unlockAccount(eth.accounts[0])    这里需要一个比较小的账号登陆这里。用来查询用，不用来转账等操作。

3. 记录一些操作名称的的具体的值，以及需要执行的对象的值，
    
    a.   eth_call  一些不需要执行命令的，查询区块链的合同命令。

****查看某个账户的token余额  0x70a08231

    例子1: curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to":"0x8f565f54d87b09edfe7962d70cc0723d966f52e0","data":"0x70a0823100000000000000000000000012915932510edde2e7a91ebdd55d5c1981d16fb3"}, "latest"],"id":1}' 
    
    例子2: curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to":"0x8f565f54d87b09edfe7962d70cc0723d966f52e0","data":"0x70a08231000000000000000000000000e1a9f573fe051a58909ca9142ca325f94502a5c2"}, "latest"],"id":1}' 

    ****某个账户的token余额  0x70a08231      balanceOf(address)  
    ****查看token总发行量    0x70a08231      totalSupply()       
    ****查看token总发行量    0x8da5cb5b      owner() 
    ****转账接口            0xa9059cbb      transfer(address,amount)
    ****发币接口            0xfe7ed06f      releasebyAdmin(address,uint256)
    ****设置发币总数         0x224ab9ed      setReserveFund(uint256)
    ****查询保留币          0xa42919b5       reservefund()


    例子2: curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_call","params":[{"to":"0x8f565f54d87b09edfe7962d70cc0723d966f52e0","data":"0x18160ddd"}, "latest"],"id":1}' 

    可以通过工具获取，也可以通过web开发，为了简单直接通过api得到吧。  工具： web3.sha3('baz(uint32,bool)')


    b.  eth_sendTransaction 

    
****转账接口 transfer接口：0xa9059cbb

    例子3: curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from":"0xe1a9f573fe051a58909ca9142ca325f94502a5c2","to":"0x8f565f54d87b09edfe7962d70cc0723d966f52e0","data":"0xa9059cbb00000000000000000000000012915932510edde2e7a91ebdd55d5c1981d16fb30000000000000000000000000000000000000000000000000000000000000001"}],"id":12}' 
   
    例子4: curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from":"0xe1a9f573fe051a58909ca9142ca325f94502a5c2","to":"0x8f565f54d87b09edfe7962d70cc0723d966f52e0","data":"0xfe7ed06f000000000000000000000000a64f345f9a97ea53e652a4646b0806136481746400000000000000000000000000000000000000000000000000000000075bcd15"}],"id":12}' 

     例子5: curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from":"0xe1a9f573fe051a58909ca9142ca325f94502a5c2","to":"0x8f565f54d87b09edfe7962d70cc0723d966f52e0","data":"0x224ab9ed00000000000000000000000000000000000000000000000000000004a817c800"}],"id":12}' 

 

     
主要的函数：

    eth_getBalance  查询以太坊余额
    curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x12915932510edde2e7a91ebdd55d5c1981d16fb3", "latest"],"id":1}'

    eth_getBalance  查询以太坊余额
    curl http://127.0.0.1:8545 -i -H 'Content-Type:application/json' -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x12915932510edde2e7a91ebdd55d5c1981d16fb3", "latest"],"id":1}'


 

 
 

 
 
 