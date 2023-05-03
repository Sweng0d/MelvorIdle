// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./MelvorIdle.sol";

contract Skills is MelvorIdle {

    mapping(uint => bool) public woodcutting;
    mapping(uint => uint) public timeWoodcutting;

    uint requiredToLevel2 = 0.1 hours;
    uint requiredToLevel3 = 1 hours;
    uint requiredToLevel4 = 10 hours;
    uint requiredToLevel5 = 3 days;
    uint requiredToLevel6 = 7 days;
    uint requiredToLevel7 = 30 days;

    modifier ownerId(uint _id) {
        require(msg.sender ==  characterToOwner[_id]);
        _;
    }
    function stopLastedSkillFarm(uint _id) external ownerId(_id) {
        if (woodcutting[_id] == true){
            woodcutting[_id] = false;
        }
    }
    
    function _trainWoodcutting(uint _id) external ownerId(_id){
        stopLastedSkillFarm(_id);
        woodcutting[_id] = true;
        timeWoodcutting[_id] = block.timestamp;
    }

    
}
