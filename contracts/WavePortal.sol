// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


import "hardhat/console.sol";


contract WavePortal {
    // a state varaiable
    uint256 totalWaves;

    // this constructor runs on the first instance of the smart contract
    constructor(){
        console.log("Yo yo, I am a contract and I am smart");
    }

    /**
    * a pure function that increments the the wave variable

    msg.sender is the wallet address of the person who called the function
     */ 
    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
    }

    // a view function that gets the value of totalwaves
    function getTotalWaves() public view returns (uint256) {
        console.log ("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}
