// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./MelvorIdle.sol";

contract Skills is MelvorIdle {

    mapping(uint => bool) public woodcutting; //id is or not woodcutting
    mapping(uint => uint) public timeWoodcutting; //how much time he is woodcutting
    mapping(uint => uint) public acumulatedTimeWoodcutting; //when id changes his action, the experience will be accumulated

    mapping(uint => bool) public fishing; //id is or not fishing
    mapping(uint => uint) public timeFishing; //how much time he is fishing
    mapping(uint => uint) public acumulatedTimeFishing; //when id changes his action, the experience will be accumulated

    uint requiredToLevel2 = 6 seconds; //he is level 1
    uint requiredToLevel3 = 60 seconds; //he is level 2
    uint requiredToLevel4 = 600 seconds; //he is level 3
    uint requiredToLevel5 = 6000 seconds; //he is level 4
    uint requiredToLevel6 = 60000 seconds; //he is level 5
    uint requiredToLevel7 = 600000 seconds; //he is level 6

    modifier ownerId(uint _id) {
        require(msg.sender ==  characterToOwner[_id]);
        _;
    }

    function stopLastSkillFarm(uint _id) public ownerId(_id) {
        if (woodcutting[_id] == true){
            acumulatedTimeWoodcutting[_id] += block.timestamp - timeWoodcutting[_id];
            woodcutting[_id] = false; // is it necessary?
        } else if (fishing[_id] == true) {
            acumulatedTimeFishing[_id] += block.timestamp - timeFishing[_id];
            fishing[_id] = true; 
        }
    }
    
    function _trainWoodcutting(uint _id) public ownerId(_id){
        stopLastSkillFarm(_id);
        woodcutting[_id] = true; // is it necessary?
        timeWoodcutting[_id] = block.timestamp;
    }

    function _levelUpWoodcutting(uint _id) public ownerId(_id){
        stopLastSkillFarm(_id);
        require(acumulatedTimeWoodcutting[_id] >= 10 ^(character[(_id)].levelWoodcutting - 1) * 6, "you dont have xp enough");
        acumulatedTimeWoodcutting[_id] -= 10 ^(character[(_id)].levelWoodcutting - 1) * 6;
        character[(_id)].levelWoodcutting++;
    }

    function _trainFishing(uint _id) public ownerId(_id){
        stopLastSkillFarm(_id);
        
    }
}
