// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract chainLiink{

    AggregatorV3Interface internal priceFeed;

    constructor() {
         //get address from here https://docs.chain.link/data-feeds/price-feeds/addresses
        priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e); //   ETH/USD
    }

    function getLatestPrice()public view returns(int){
        (,int price,,,)= priceFeed.latestRoundData();
        return price;
    }
     
}