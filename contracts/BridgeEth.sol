// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ITestTokenEth {
  function mint(address to, uint amount) external;
  function burn(address from, uint amount) external;
}

contract BridgeEth {
  address public owner;
  ITestTokenEth public token;

  event Burn( address from, address to, uint amount);

  constructor(address _token) {
    owner = msg.sender;
    token = ITestTokenEth(_token);
  }

  function burn(address to, uint amount) external {
    token.burn(msg.sender, amount);
    emit Burn(msg.sender, to, amount);
  }

  function mint(address to, uint amount) external {
    require(msg.sender == owner, "Only owner can perform this action");
    token.mint(to, amount);
  }
}