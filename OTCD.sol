pragma solidity ^0.4.18;
 
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}
  
contract OTCD {
  using SafeMath for uint256;
  event Transfer(address indexed from, address indexed to, uint tokens); 
  mapping(address => uint256) balances;
  string public name = "OTCD";
  string public symbol = "OCTD"; 
  uint8 public decimals = 0;
  uint256 totalSupply_ = 100000000 ; 
  function OTC() public { 
    balances[msg.sender] = totalSupply_; 
    Transfer(0x0, msg.sender, totalSupply_);
  }

  function totalSupply() public view returns (uint256) {
    return totalSupply_ ;
  }

  function transfer(address _to, uint256 _value) public returns (bool) { 
    require(_to != address(0) && _value > 0);
    require(_value <= balances[msg.sender]);  
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  } 
  
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

}
