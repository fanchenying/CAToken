# CAToken

//only transfer api//

balanceOf(address _owner)

transfer(address _to, uint256 _value)

# add owner 
  address owner;
  function BasicToken() public {
      owner = msg.sender ;
   }


# add openMarket date  
  
  uint public constant MarketDate = 1519615600; #timestamp
  
  #in function  transfer(address _to, uint256 _value)   
  
  add  require( now > MarketDate || msg.sender == owner );  
  
  
  
 
#add big holder limit .

#add big holder limit .

# from zeppelin-solidity
