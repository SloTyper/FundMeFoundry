//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
  function run() external returns (FundMe){
    //Before startBroadcase = not a real txn
    HelperConfig helperConfig = new HelperConfig();
    address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
    //After startBroadcase = a real txn
    vm.startBroadcast();
    FundMe fundMe = new FundMe(ethUsdPriceFeed);
    vm.stopBroadcast();
    return fundMe;
  }
}