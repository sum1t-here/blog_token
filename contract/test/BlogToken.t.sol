// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/BlogToken.sol";

contract BlogTokenTest is Test {
    BlogToken public token;
    address public owner = address(1);

    function setUp() public {
        token = new BlogToken(1000000, owner);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1000000 * 10 ** 18);
        assertEq(token.balanceOf(owner), 1000000 * 10 ** 18);
    }

    function testTransfer() public {
        address recipient = address(2);
        uint256 amount = 100 * 10 ** 18;

        vm.prank(owner);
        token.transfer(recipient, amount);

        assertEq(token.balanceOf(recipient), amount);
    }
}
