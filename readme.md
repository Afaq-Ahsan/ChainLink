Get a random number using VRF (Verifiable Random Function).

=>TO GET RANDOM NUMBER FOLLOW THESE STEPS
 
1. Deploy the Contract: Deploy a contract that utilizes the Chainlink VRF functionality. You can use the provided contract code or customize it according to your requirements.

2. Fund the Subscription: Obtain testnet LINK tokens from the Chainlink faucet and transfer them to the contract's subscription ID. The subscription ID represents the funding source for the VRF requests.

3. Set the KeyHash: Determine the KeyHash value for the desired VRF key. The KeyHash uniquely identifies the VRF key used to generate random numbers.

4. Make a Random Number Request: Call the `requestRandomWords()` function in the deployed contract. This function should be accessible only to the contract owner or a designated address with the necessary permissions. The request should include the KeyHash, subscription ID, desired number of request confirmations, callback gas limit, and the number of random words (set to 1 in this case).

5. Wait for Request Fulfillment: After making the request, you need to wait for the Chainlink VRF coordinator to fulfill it. The fulfillment process involves generating the random number and calling the contract's `fulfillRandomWords()` function with the generated random number as an argument.

6. Check Request Status: You can use the `getRequestStatus()` function in the contract to check the fulfillment status and retrieve the random number generated by the VRF coordinator. If the request has been fulfilled, the function will return the fulfillment status as `true` and the generated random number.

Please note that the above process assumes you are using the Chainlink testnet and the provided contract as a starting point. The actual deployment and usage process may vary depending on your specific requirements and the network you are operating on.

