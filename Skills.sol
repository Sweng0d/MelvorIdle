// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "./MelvorIdle.sol";

contract Skills is MelvorIdle {

    mapping(uint => bool) woodcutting;

    modifier ownerId(uint _id) {
        require(msg.sender ==  characterToOwner[_id]);
        _;
    }
    
    function _trainWoodcutting(uint _id) external ownerId(_id){}
}
