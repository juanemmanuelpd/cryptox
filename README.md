# Cryptox (ctx)
## Overview
Cryptox (CTX) is a cryptocurrency based on the ERC20 standard. The maximum circulating supply is fixed to prevent inflation.

## Features 📃

* Maximum circulating supply - 1,000,000 CTX
* Mint - The owner of the contract can mint new tokens, with a maximum limit (100,000) and minimum (100) of tokens per transaction, in order to avoid abrupt manipulations that affect the price.
* Burn - The contract owner can burn tokens with a maximum limit (100,000) of tokens per transaction, in order to maintain a fixed maximum supply of circulating tokens.
* Multitransfer - Anyone can make multiple transfers, when it is required to send the same amount of tokens to 3 different addresses.
* Pause and unpause - The contract owner can pause transactions (mint, burn, multitransfer) in case of emergency, and later resume them.

## Technical details ⚙️

* Integrated Development Environment - Remix (Ethereum IDE)
* Solidity Compiler Version - 0.8.24

## Deploying the contract 🛠️

1. Open Remix IDE. Available at https://remix.ethereum.org
2. Go to the "File explorer" tab and create a new file with the .sol extension in the "Contracts" folder
3. Copy the cryptox.sol code and paste it into the .sol file you created
4. Go to the "Solidity compiler" tab and select version 0.8.24
5. Compile the code by pressing CTRL + S if you are on Windows, or COMMAND + S if you are on Mac OS
6. If you find no errors, go to the "Deploy and Execute Transactions" tab and select your "Environment" and "Account." Finally, enter the "Name" and "Symbol" of your cryptocurrency. Once done, click "Deploy" to deploy the cryptocurrency to the blockchain.

## Technical details 💻

*  modifier permission() - This modifier is used to ensure that only the owner of the contract performs the transaction.
*  modifier maximumsupply() - This modifier is used to ensure that the fixed maximum amount of tokens in circulation is not exceeded.
*  function mint() - This function is only accessible to the contract owner and is responsible for minting new tokens to any address.
*  function burn() - This function is only accessible to the owner of the contract and is responsible for burning tokens from any address.
*  function multitransfer() - This function is accessible by anyone and is responsible for transferring the same amount of tokens to 3 different addresses.
*  function pausetransactions() - This feature is only accessible by the contract owner and is responsible for pausing minting, burning and multitransfers in case of emergency.
*  function unpausetransactions() - This feature is only accessible by the contract owner and is responsible for resuming minting, burning and multitransfers when the problems have been solved or the emergency has ended.

