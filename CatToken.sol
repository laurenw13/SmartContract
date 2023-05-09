// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract KittyShelter {

    uint public totalCatsAdopted;
    uint public adoptionFee;
    mapping(address => uint) private numOfCatsByAddress;

    constructor(uint fee) {
        totalCatsAdopted = 0;
        adoptionFee = fee;
    }

    function getTotalCatsAdopted() external view returns(uint) {
        return totalCatsAdopted;
    }

    function viewMyNumOfCats() external view returns(uint) {
        return numOfCatsByAddress[msg.sender];
    }

    function adoptCats() payable external {
        uint numOfCats = uint(msg.value) / adoptionFee;
        numOfCatsByAddress[msg.sender] += numOfCats;
        totalCatsAdopted += numOfCats;
    }
}  