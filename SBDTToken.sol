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
 
contract ERC20Interface { 
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    //function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    //function approve(address spender, uint tokens) public returns (bool success);
    //function transferFrom(address from, address to, uint tokens) public returns (bool success); 
    event Transfer(address indexed from, address indexed to, uint tokens);
    //event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

//contract ApproveAndCallFallBack { 
//  function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
//}
 
contract Owned { 
    address public owner;
    address public newOwner; 
 
    event OwnershipTransferred(address indexed _from, address indexed _to); 
    
    function Owned() public {
        owner = msg.sender;
        largedistributor = msg.sender;
        smalldistributor = msg.sender;
        reservefundeditor = msg.sender;
    } 
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    } 
    
    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
        smalldistributor = _newOwner;
        largedistributor = _newOwner;
        reservefundeditor = _newOwner;
    } 
    
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    } 

    address smalldistributor = address(0);
    address largedistributor = address(0);
    address reservefundeditor = address(0);
    
    function  setLargedistributor(address _to) onlyOwner public {
      require(_to != address(0));
      largedistributor = _to;
    } 

    function  setReservefundeditor(address _to) onlyOwner public {
      require(_to != address(0));
      reservefundeditor = _to;
    }

    function  setSmalldistributor(address _to) onlyOwner public {
      require(_to != address(0));
      smalldistributor = _to;
    }

    function  getLargedistributor() public view returns (address) {
      return largedistributor;
    } 
    function  getReservefundeditor() public view returns (address) {
      return reservefundeditor;
    }
    function  getSmalldistributor() public view returns (address) {
      return smalldistributor;
    }
}

contract SBDTToken is ERC20Interface,Owned {

  string public constant name = "SBDTToken";
  string public constant symbol = "SBDT";
  uint8 public constant  decimals = 2;
  uint public constant limitacountlockuntil = 1519786800 ;//2018/2/28 11:00:00
  uint public constant lockuntil = 1519781400 ;//2018/2/28 09:30:00
  uint public constant limitacount =  10000 * 10 ** uint256(decimals);
  uint public constant largelimit =  10000 * 10 ** uint256(decimals);
  
  uint256 public reservefund = 100000000 * 10 ** uint256(decimals);
  uint256 public releasefund = 0;
  using SafeMath for uint256;
 
  event Burn(address indexed from, uint256 value);
 
  mapping(address => uint256) balances;
  
  mapping (address => mapping (address => uint256)) public allowance;

  modifier lockTime {
        require(now>lockuntil);
        _;
  } 

//   function SBDTToken() public {
//    //  balances[msg.sender] = reservefund; 
//    //  Transfer(0x0, msg.sender, reservefund);
//   }

  function totalSupply() public view returns (uint256) {
     return reservefund;
  }

  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

  function releasebyAdmin(address _to, uint256 _value) public returns (bool) {
    require(msg.sender==smalldistributor || msg.sender==largedistributor);
    require(_to != address(0) && _value > 0); 
    if ( _value > largelimit ) {
        require(msg.sender==largedistributor);
    }
    require(_value <= reservefund - releasefund); 
    releasefund = releasefund.add(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(0x0, _to, _value);
    return true;
  }

  function transfer(address _to, uint256 _value) public lockTime returns (bool) { 
    require(_to != address(0) && _value > 0);
    require(_value <= balances[msg.sender]); 
    if ( balances[msg.sender] >= limitacount) {
            require(now>limitacountlockuntil);
    }
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  function burn(uint256 _value) public returns (bool success) {
        require(_value > 0 && balances[msg.sender] >= _value);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        releasefund = releasefund.sub(_value);
        Burn(msg.sender, _value);
        return true;
  }

  function setReserveFund(uint256 _value) public returns (bool) {
    require(msg.sender==reservefundeditor && _value >= releasefund); 
    reservefund = _value * 10 ** uint256(decimals);
    return true;
  }

}
