
// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

contract MelvorIdle {
    
    Character[] public character;
    Classes public class;
    uint public initialGold = 0;
    uint public startLevel = 1;
    uint public maxLevel = 99;

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

    }

    enum Classes {
        Warrior,
        Archer,
        Mage
    }

    function _createCharacter(string memory _name, Classes _class) public payable {
        require(msg.value == 1 ether);
        character.push(Character(character.length, _name, msg.sender, _class, initialGold, startLevel, startLevel));
        characterToOwner[character.length] = msg.sender;
        numOfCharacters[msg.sender] ++;
        emit CharacterCreated(msg.sender);
    }

}
