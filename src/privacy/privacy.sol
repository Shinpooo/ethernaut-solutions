// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Privacy {
  // SLOT 0
  bool public locked = true; // 1 byte
  // SLOT 1 
  uint256 public ID = block.timestamp; // 32 bytes
  // SLOT2 
  uint8 private flattening = 10; // 1 byte
  uint8 private denomination = 255; // 1 byte
  uint16 private awkwardness = uint16(now); // 2 bytes

  // SLOT 3 -> bytes[0]
  // SLOT 4 -> bytes[1]
  // SLOT 5 -> bytes[2]
  bytes32[3] private data;

  // Get the password at slot 5
  // await web3.eth.getStorageAt(instance, 5, console.log)
  // The password is the 32 first hexadecimals (bytes16) of the result 

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}