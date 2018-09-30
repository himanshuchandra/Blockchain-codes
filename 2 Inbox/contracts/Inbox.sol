pragma solidity ^0.4.17;   //solidity version

contract Inbox{            // creates a new contract
    string public message;
    constructor(string initialMessage) public{
        message = initialMessage;
    }

    function setMessage(string newMessage) public{
        message = newMessage;
    }

    function getMessage() public view returns(string){
        return message;
    }
}