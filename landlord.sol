pragma solidity >=0.4.22 <0.6.0;

contract check {
    
     uint public dAmount;
     uint public bAmount;
     uint public din;
     bool public valid;
     uint constant date=12;
     uint constant rent = 1000;
     
    function deposit(uint x) public {
       dAmount  = x;
       
       bAmount=rent-dAmount;
    }
    
    function time(uint y) public {
       din  = y;
    }
    
    function determine() public {
        if (dAmount % rent == 0 && din <= date) 
        {   
            valid = true;
        }
        else 
        {   
            valid = false;
        }

       
    }
    
    address public landlord;
    mapping (address => uint) public balances;

   
    constructor() public{
        landlord = msg.sender;
    }

    function capital(address lord, uint amount) public  {
        if (msg.sender != landlord) return;
        balances[lord] += amount;
       
    }

    function send(address lord,address tenant) public {
        
        if (dAmount==rent) 
        {
        balances[lord] += dAmount;
        balances[tenant] -= dAmount;
        }
        
        else
        {
        balances[lord] += bAmount;
        balances[tenant] -= bAmount;
        }
    }
}











