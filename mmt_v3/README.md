# MMT v3 interface
This document provides guidelines for integrating with the MMT V3 contract.

## GitHub Tags corresponding to different networks

| Tag of Repo    | Network | Latest published at address                                        |
|----------------| ------- | ------------------------------------------------------------------ |
| mainnet-v1.0.0 | mainnet | 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860 |
| testnet-v1.0.0 | testnet | 0xd7c99e1546b1fc87a6489afdc08bcece4ae1340cbd8efd2ab152ad71dea0f0f2 |

eg:

mainnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-contract-interface.git", subdir = "mmt_v3", rev = "mainnet-v1.0.0" }
```

testnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-contract-interface.git", subdir = "mmt_v3", rev = "testnet-v1.0.0" }
```

## Usage

The MMT V3 interface provides function definitions only and is not a complete implementation. As a result, the Sui client may flag version inconsistencies when verifying the code. However, this does not impact the contract's functionality.

To bypass version validation issues during deployment, use the --dependencies-are-root flag during the build and publish process:
```bash
sui move build --dependencies-are-root && sui client publish --dependencies-are-root
```

