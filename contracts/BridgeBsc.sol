// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ITestTokenBsc {
  function mint(address to, uint amount) external;
  function burn(address from, uint amount) external;
}

contract BridgeBsc {
  address public owner;
  ITestTokenBsc public token;

  event Burn( address from, address to, uint amount);

  constructor(address _token) {
    owner = msg.sender;
    token = ITestTokenBsc(_token);
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