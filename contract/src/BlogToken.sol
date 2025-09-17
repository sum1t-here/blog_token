// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BlogToken is ERC20 {
    constructor(uint256 initalSupply, address initialOwner) ERC20("BlogToken", "BLT") {
        _mint(initialOwner, initalSupply * 10 ** decimals());
    }
}
