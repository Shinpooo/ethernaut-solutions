// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract LibraryContract {
  address public timeZone1Library = address(1);
  address public timeZone2Library = address(2);
  address owner;


  
    function setTime(uint _time) public {
        owner = address(3);
    }

}
