// SPDX-License-Identifier: MPL-2.0-no-copyleft-exception
pragma solidity ^0.8.7;

contract PeopleCount {
    uint256 public numPeople;
    address public contractOwner;

    struct Person {
        uint256 id;
        string firstName;
        string lastName;
        address walletAddress;
    }

    /*IN-CLASS EXERCISE 1*/
    //1. Write a constructor to initialise count
    constructor() {
        numPeople = 0;
        contractOwner = msg.sender;
    }

    //2. Add a mapping
    mapping(address => Person[]) public members;

    //3. Write a function to return the total number of people in the contract (count of people)
    function getNumPeople() public view returns (uint256) {
        return numPeople;
    }

    /*IN-CLASS EXERCISE 2*/
    //1. Write a function to add a person.
    function addPerson(
        address walletAddress,
        string memory firstName,
        string memory lastName
    ) public isOwner {
        Person memory person1 = Person({
            id: numPeople,
            firstName: firstName,
            lastName: lastName,
            walletAddress: walletAddress
        });

        //Add Person and increment counter
        members[walletAddress].push(person1);
        numPeople = numPeople + 1;
    }

    // 2. Write a modifier to give access control (you can either give the
    // access control for a particular address or to the address with which the contract has been deployed)
    modifier isOwner() {
        require(msg.sender == contractOwner);
        _;
    }
}
