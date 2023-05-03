
// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MelvorIdle {
    
    Character[] public character;
    Classes public class;
    uint public initialGold = 0;
    uint public startLevel = 1;
    uint public maxLevel = 99;

    mapping(address => uint) myCharacters;

    struct Character {
        uint id;
        string name;
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
        character.push(Character(character.length - 1, _name, _class, initialGold, startLevel, maxLevel));
        myCharacters[msg.sender] = character.length -1;
    }

}
