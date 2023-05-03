
// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MelvorIdle {
    
    Character[] public character;
    Classes internal class;
    uint public initialGold = 0;
    uint public startLevel = 1;
    uint public maxLevel = 99;

    mapping(address => uint) myCharacters;

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
        //require(msg.value == 1 ether);
        character.push(Character(character.length - 1, _name, msg.sender, _class, initialGold, startLevel, startLevel));
        myCharacters[msg.sender] = character.length -1;
        //emit CharacterCreated(msg.sender);
    }

}
