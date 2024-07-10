// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    constructor(address initialOwner, uint256 initialSupply) ERC20("DegenGamingToken", "DGT") Ownable(initialOwner) {
        _mint(initialOwner, initialSupply); // Mint the initial supply to the owner
    }

    // Mint function - only the contract owner can mint tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn function - any user can burn their own tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Redeem function - any user can redeem tokens for in-game items
    function redeem(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
