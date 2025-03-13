# MMT v3 interface
This is an endpoint to help everyone integrate with the MMT V3 contract.

## Tags corresponding to different networks

| Tag of Repo | Network | Latest published at address                                        |
|-------------| ------- | ------------------------------------------------------------------ |
| mian        | mainnet | 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860 |

eg:

mainnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-v3-interface.git", subdir = "mmt_v3", rev = "main" }
```

## Usage

Mmt v3 interface is not complete(just have function definition), so it will fails when sui client check the code version. However, this does not affect its actual functionality. Therefore, we need to add a `--dependencies-are-root` during the build.

```bash
sui move build --dependencies-are-root && sui client publish --dependencies-are-root
```

