//SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.18;

contract FunctionsExample{

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable{
        require(balanceReceived[msg.sender]+msg.value>=balanceReceived[msg.sender],"Failed");
        balanceReceived[msg.sender] +=msg.value;
    }
    function withrawMoney(address payable _to, uint _amount) public {
        require(_amount <=balanceReceived[msg.sender],"not enough funds");
        assert(balanceReceived[msg.sender]>=balanceReceived[msg.sender]-_amount);
        balanceReceived[msg.sender]-=_amount;
        _to.transfer(_amount);
    }
    receive() external payable{
        receiveMoney();
    }







}