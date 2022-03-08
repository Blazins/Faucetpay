// SPDX-License_Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

//Abstract classes allow us to ensure that child classses implement the function

abstract contract Logger{

    uint testNum;

    constructor(){
        testNum = 1000;
    }

    function emitLog() public pure virtual returns(bytes32);

    function test3() external pure returns(uint){
        return 100;
    }
}