// SPDX-License_Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

interface iFaucet{

    function addFunds() external payable;

    function withdraw(uint withdrawAmount) external;
}

//Interface cannot inherit from other smart constructors
//Only inherit from other interfaces
//Cannot declare constructors
//Cannot declare state variables
//All functions have to be declared externally