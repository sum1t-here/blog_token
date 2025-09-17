// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/BlogToken.sol";

contract DeployBlogToken is Script {
    function run() external returns(BlogToken){
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // from .env
        vm.startBroadcast(deployerPrivateKey);

        // Deploy BlogToken with 1,000,000 tokens
        BlogToken token = new BlogToken(1_000_000, msg.sender);

        vm.stopBroadcast();

        console.log("BlogToken deployed at:", address(token));
        console.log("Total supply:", token.totalSupply());

        return token;
    }
}