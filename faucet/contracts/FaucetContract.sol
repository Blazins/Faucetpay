// SPDX-License_Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

import "./Owned.sol";
import "./Logger.sol";
import "./iFaucet.sol";

contract Faucet is Owned,Logger,iFaucet{
    //special function to receive eth and update balance
    //used when a transaction is made that doesn't specify function name to call

    //address type keeps value of address -20byte address

    uint public numOfFunders;

    mapping(address => bool) private funders;
    mapping(uint  => address) private lutFunders;

    modifier limitWithdraw(uint withdrawAmount){
         require
        (
            withdrawAmount <= 100000000000000000, 
            "Cannot withdraw more than 0.1 ether"
        );
        _; //parameter sent to limitWithdraw (function body)
        //execute payable(transfer ether)

    }

    receive() external payable {}

    function emitLog() public override pure returns(bytes32){

        return "Hello World";
    }
    
    function addFunds() override external payable {
       address funder = msg.sender;
       if(!funders[funder]){
           uint index = numOfFunders++;
           funders[funder] = true;
           lutFunders[index] = funder;
       }
    }

    function test1() external onlyOwner{
        //Management only admin should have access to

    }

    function test2() external onlyOwner{
        //Management only admin should have access to
    }

    function withdraw(uint withdrawAmount) override external limitWithdraw(withdrawAmount){
        
        payable(msg.sender).transfer(withdrawAmount);
        
        
    } 

    function getAllFunders() external view returns(address [] memory){
        
        address[] memory _funders = new address[](numOfFunders);
        for(uint i=0; i < numOfFunders; i++){
           _funders[i] = lutFunders[i]; 
        }

        return _funders;
    }

   

    function getFunderAtIndex(uint8 index) external view returns(address){
        // address[] memory _funder = getAllFunders();
        //this.getAllFunders(); costs more gas
        return lutFunders[index];
        
    }
    //with external tag the function cannot be called internally

  

    //transactions generate gas fees
    //pure/view - read-only no gas-fee
    //pure vs view - you don't need to change ethereum state
    //no storage variables are altered
    //view indicates no storage is altered
    //pure - more strict won't even read storage state


    //To talk to the node on the network we need to make JSONRPC calls
    
    //const instance = await Faucet.deployed()
    //instance.addFunds({from: accounts[0], value :" 200000000 "})
    //instance.addFunds({from: accounts[0], value :" 200000000 "})

}