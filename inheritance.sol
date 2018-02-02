pragma solidity ^0.4.11;
 
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
 
  address public owner;
 
  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {
    owner = msg.sender;
  }
 
 
  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
 
 
  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) onlyOwner {
    require(newOwner != address(0));      
    owner = newOwner;
  }
 
}
 
/**
 * @title Destructible
 * @dev Base contract that can be destroyed by owner. All funds in contract will be sent to the owner.
 */
contract Destructible is Ownable {
 
  function Destructible() payable { } 
 
  /**
   * @dev Transfers the current balance to the owner and terminates the contract. 
   */
  function destroy() onlyOwner {
    selfdestruct(owner);
  }
 
  function destroyAndSend(address _recipient) onlyOwner {
    selfdestruct(_recipient);
  }
}
 
contract BankAccount is Ownable, Destructible {
 
  function store() public payable {
      
  } 
 
  function withdraw(uint amount) public onlyOwner {
      if (this.balance >= amount) {
        msg.sender.transfer(amount);
      }
  } 
 
}