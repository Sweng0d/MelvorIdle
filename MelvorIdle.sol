// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MelvorIdle {
    
    Character[] public character;
    uint public initialGold = 0; //change to internal?
    uint public startLevel = 1; //change to internal?
    uint public maxLevel = 99; //change to internal?
    uint public initialItens = 0; //change to internal?

    mapping(uint => address) public characterToOwner;
    mapping(address => uint) public numOfCharacters;

    event CharacterCreated(address indexed owner);

    struct Character {
        uint id;
        string name;
        address owner;
        Classes class;
        uint gold;
        uint levelWoodcutting;
        uint levelFishing;
        uint wood;
        uint fish;
    }

    enum Classes {
        Warrior,
        Archer,
        Mage
    }

    function _createCharacter(string memory _name, Classes _class) public payable {
        require(msg.value == 1 ether);
        character.push(Character(character.length, _name, msg.sender, _class, initialGold, startLevel, startLevel, initialItens, initialItens));
        characterToOwner[character.length -1] = msg.sender;
        numOfCharacters[msg.sender] ++;
        emit CharacterCreated(msg.sender);
    }

}
