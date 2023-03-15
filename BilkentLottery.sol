// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BilkentBlockchainLottery is Ownable, VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;
    uint64 subscriptionId;

    //Sepolia testnet
    address vrfCoordinator = 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625;
    bytes32 private keyHash = 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;
    uint16 private requestConfirmations = 5;

    uint256 public lastRandomWord;
    uint32 private callbackGasLimit = 100000;
    uint32 private numWords = 1;

    constructor(uint64 _subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        subscriptionId = _subscriptionId;
    }

    //Note that bitwise left-shift operation is used to generate more random numbers from the VRF output.
    function revealWinners(uint256 winnerCount, uint256 participantCount) public view returns (uint256[] memory) {
        uint256[] memory winnerArray = new uint256[](winnerCount);
        uint256 tempRand = lastRandomWord;

        for (uint i = 0; i < winnerCount; i++) {
            uint256 winnerNum = tempRand % participantCount;
            winnerArray[i] = (winnerNum+1);
            tempRand >>= 1;
        }
        return winnerArray;
    }

    function requestRandomWords() external onlyOwner {
        COORDINATOR.requestRandomWords(
        keyHash,
        subscriptionId,
        requestConfirmations,
        callbackGasLimit,
        numWords
        );  
    }

    function changeSubscriptionId(uint64 _newId) external onlyOwner {
        subscriptionId = _newId;
    }

    function fulfillRandomWords(
        uint256, /* requestID */
        uint256[] memory randomWords
    ) internal override {
        lastRandomWord = randomWords[0];
    }
}