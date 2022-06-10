// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestTokenBsc is ERC20 {

    address public owner;
    uint public MAXSUPPLY = 10000 * 10**decimals();

    constructor() ERC20("TESTTKNBSC", "bTETH") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can perform this action");
        _;
    }

    function updateOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function mint(address to, uint amount) external onlyOwner {
        require(totalSupply()+amount <= MAXSUPPLY, "Supply limit exceeding");
        _mint(to,amount);
    }

    function burn(address from, uint amount) external onlyOwner {
        _burn(from, amount);
    }


}