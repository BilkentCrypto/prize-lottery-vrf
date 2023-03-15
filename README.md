# Bilkent Blockchain Prize Lottery

This GitHub repository contains the code of the program resources that Bilkent Blockchain Club will use for their giveaways at meetups. Normally, the lotteries are conducted using a random number from scripts whose computations cannot be verified, and the transparency of the draw can be questioned. Note that Chainlink's [VRF service](https://docs.chain.link/vrf/v2/introduction/) has been used to ensure that the randomness in the draw process is fair and transparent. With VRF, we can reach random numbers whose randomness can be verified and whose fairness cannot be proven. 

For Bilkent Blockchain Lottery, Ethereum Sepolia testnet will be utilized. Our contract address can be reached [here](https://sepolia.etherscan.io/address/0xb076ab28db047b777f3f892ef7d8f3490177ef94). The contract is verified, so the participants can check if there is a cheat in the lottery system.

The lottery process will work as follows:

- A random number output is requested from the Chainlink VRF services during the meetup in front of all the participants.
- The number of participants and the desired number of winners are determined. 
- The winner numbers can be reached by calling revealWinners() function whilst putting the necessary arguments.
- Those numbers should correspond to the participants' seat numbers.
- Finally, participants can enjoy their prizes!

## 🔗 Links
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/blkntblockchain)
