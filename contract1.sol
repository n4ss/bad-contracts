pragma solidity ^0.4.15;

contract BalanceManager {
    mapping (address => uint) userBalance;
   
    function getBalance(address u) constant returns(uint){
        return userBalance[u];
    }

    function addToBalance() payable{
        userBalance[msg.sender] += msg.value;
    }   

    /*
     * Solidity supports three ways of transferring ether between wallets
     * and smart contracts. These supported methods of transferring ether
     * are send(), transfer() and call.value(). The methods differ by how
     * much gas they pass to the transfer for executing other methods (in
     * case the recipient is a smart contract), and by how they handle
     * exceptions. send() and call().value() will merely return false upon
     * failure but transfer() will throw an exception which will also
     * revert state to what it was before the function call.
     */
    function withdrawBalance(){
        if( ! (msg.sender.call.value(userBalance[msg.sender])() ) ){
            throw;
        }
        userBalance[msg.sender] = 0;
    }
}
