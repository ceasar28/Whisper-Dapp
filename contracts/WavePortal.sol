// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


import "hardhat/console.sol";


contract WavePortal {
    // a state varaiable
    uint256 totalWaves;

    event NewWave( address indexed from, uint256 timestamp, string message);

    // a struct to store our wave
    struct Wave {
        address waver; // the address of who waved.
        string message; // the message the user sent
        uint256 timestamp; // the timestamp when the user waver
    }

    // an array of structs, which holds all the wave anyone ever send to me!

    Wave[] waves;

    // this constructor runs on the first instance of the smart contract
    constructor(){
        console.log("Whisper Smart contract");
    }

    /**
    * a pure function that increments the the wave variable

    msg.sender is the wallet address of the person who called the function
     */ 
    function wave(string memory _message) public {
        totalWaves += 1;
        waves.push(Wave(msg.sender,_message, block.timestamp));
        console.log("%s whispered w/ message %s!", msg.sender);

        emit NewWave(msg.sender,block.timestamp, _message);
    }

    // a view function that gets the value of totalwaves
    function getTotalWaves() public view returns (uint256) {
        console.log ("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    // function to get all waves struct from the array
    function getAllWaves()public view returns (Wave[] memory) {
        return waves;
    }
}
