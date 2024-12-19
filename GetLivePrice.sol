/// Smart Contract to Fetch Live Prices and Add Users Based on Payment Threshold

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {
    AggregatorV3Interface internal priceFeed1;  // ETH/USD
    AggregatorV3Interface internal priceFeed2;  // BTC/USD
    AggregatorV3Interface internal priceFeed3;  // DAI/USDT

    address[] public users;  // List to store users who pay >= 1000 USD

    // Constructor to initialize the price feeds
    constructor() {
        priceFeed1 = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        ); // ETH/USD
        priceFeed2 = AggregatorV3Interface(
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        ); // BTC/USD
        priceFeed3 = AggregatorV3Interface(
            0x14866185B1962B63C3Ea9E03Bc1da838bab34C19
        ); // DAI/USDT
    }

    // Function to get the latest ETH/USD price
    function getLatestPriceETHUSD() public view returns (int256) {
        (, int256 price, , , ) = priceFeed1.latestRoundData();
        return price; // This returns the latest ETH price in USD with 8 decimal places
    }

   function addUser() public payable {
    int256 ETHUSDT = getLatestPriceETHUSD();

    // Convert the payment from Ether to USD
    uint256 ethInUsd = uint256(ETHUSDT) * msg.value / 1e26;  // 18 decimals for msg.value + 8 decimals for price feed

    // Check if the payment is >= 1000 USD
    require(ethInUsd >= 3, "You need to pay at least 3 USD worth of Ether");

    // Add the user to the list
    users.push(msg.sender);
}

    // Function to get the list of users
    function getUsers() public view returns (address[] memory) {
        return users;
    }
}
