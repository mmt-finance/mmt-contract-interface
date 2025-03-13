# Slippage check interface
This document provides guidelines for integrating with the Slippage Check contract.

## GitHub Tags corresponding to different networks

| Tag of Repo    | Network | Latest published at address                                        |
|----------------| ------- | ------------------------------------------------------------------ |
| mainnet-v1.0.0 | mainnet | 0x8add2f0f8bc9748687639d7eb59b2172ba09a0172d9e63c029e23a7dbdb6abe6 |
| testnet-v1.0.0 | testnet | 0xfd6a45c396a90811fd93efaf585cc95c29aecd079c87822893f1e97e3fee8c50 |

eg:

mainnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-contract-interface.git", subdir = "slippage_check", rev = "mainnet-v1.0.0" }
```

testnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-contract-interface.git", subdir = "slippage_check", rev = "testnet-v1.0.0" }
```

## Usage

The Slippage Check interface provides function definitions only and is not a complete implementation. As a result, the Sui client may flag version inconsistencies when verifying the code. However, this does not impact the contract's functionality.

To bypass version validation issues during deployment, use the --dependencies-are-root flag during the build and publish process:
```bash
sui move build --dependencies-are-root && sui client publish --dependencies-are-root
```

