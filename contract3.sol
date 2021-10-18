pragma solidity ^0.4.15;

contract WalletContract{
    address private owner;
    uint private sellerBalance=0;

    function WalletContract()
        public 
    {
        owner = msg.sender;
    }

    function sensitiveChangeOwner(address _newOwner) 
        public
    {
       owner = _newOwner;
    }

    function addToSellerBalance(uint value)
        public
    {
        require(msg.sender==owner);
        sellerBalance += value;
    }

    function subFromSellerBalance(uint value)
        public
    {
        require(msg.sender==owner);
        sellerBalance -= value;
    }
}
