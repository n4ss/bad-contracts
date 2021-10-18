pragma solidity ^0.4.16;

contract ERC20 {
    function totalSupply() constant returns (uint totalSupply);
    function balanceOf(address _owner) constant returns (uint balance);
    function transfer(address _to, uint _value) returns (bool success);
    function transferFrom(address _from, address _to, uint _value) returns (bool success);
    function approve(address _spender, uint _value) returns (bool success);
    function allowance(address _owner, address _spender) constant returns (uint remaining);
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}

contract MoneyManager{
    address private owner;
    uint public price;
    ERC20 token;

    function MoneyManager(uint _price, ERC20 _token)
        public 
    {
        owner = msg.sender;
        price = _price;
        token = _token;
    }

    function buyToken(uint new_price) payable
        public
    {
        require(msg.value >= price);

        token.transferFrom(msg.sender, owner, price);

        price = new_price;
        owner = msg.sender;
    }

    function updateTokenPrice(uint new_price){
        require(msg.sender == owner);
        price = new_price; 
    }
}
