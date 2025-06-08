# MMT v3 interface
This document provides guidelines for integrating with the MMT V3 contract.

## GitHub Tags corresponding to different networks

| Tag of Repo    | Network              | address                                                            | 
|----------------|----------------------|--------------------------------------------------------------------|
| mainnet-v1.1.3 | mainnet package id   | 0x70285592c97965e811e0c6f98dccc3a9c2b4ad854b3594faab9597ada267b860 |  
| mainnet-v1.1.3 | mainnet published at | 0xc84b1ef2ac2ba5c3018e2b8c956ba5d0391e0e46d1daa1926d5a99a6a42526b4 |  
| testnet-v1.0.1 | testnet package id   | 0xd7c99e1546b1fc87a6489afdc08bcece4ae1340cbd8efd2ab152ad71dea0f0f2 | 
| testnet-v1.0.1 | testnet published at | 0xd7c99e1546b1fc87a6489afdc08bcece4ae1340cbd8efd2ab152ad71dea0f0f2 | 


eg:

mainnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-contract-interface.git", subdir = "mmt_v3", rev = "mainnet-v1.1.3" }
```

testnet:

```
MmtV3 = { git = "https://github.com/mmt-finance/mmt-contract-interface.git", subdir = "mmt_v3", rev = "testnet-v1.0.1" }
```

## Usage

The MMT V3 interface provides function definitions only and is not a complete implementation. As a result, the Sui client may flag version inconsistencies when verifying the code. However, this does not impact the contract's functionality.

To bypass version validation issues during deployment, use the --dependencies-are-root flag during the build and publish process:
```bash
sui move build --dependencies-are-root && sui client publish --dependencies-are-root
```

### Data Structure

1. Position

```move
public struct Position has store, key {
    id: UID,
    pool_id: ID,
    fee_rate: u64,
    type_x: TypeName,
    type_y: TypeName,
    tick_lower_index: I32,
    tick_upper_index: I32,
    liquidity: u128,
    fee_growth_inside_x_last: u128,
    fee_growth_inside_y_last: u128,
    owed_coin_x: u64,
    owed_coin_y: u64,
    reward_infos: vector<PositionRewardInfo>,
    }
```
2. Pool

```move
public struct Pool<phantom X, phantom Y> has key {
    id: UID,
    type_x: TypeName,
    type_y: TypeName,
    // current state of pool
    sqrt_price: u128,
    liquidity: u128,
    tick_index: I32,
    // global configs
    tick_spacing: u32,
    max_liquidity_per_tick: u128,
    fee_growth_global_x: u128,
    fee_growth_global_y: u128,
    // pool reserves
    reserve_x: Balance<X>,
    reserve_y: Balance<Y>,
    // fees 
    swap_fee_rate: u64,
    flash_loan_fee_rate: u64,
    protocol_fee_share: u64,
    protocol_flash_loan_fee_share: u64,
    protocol_fee_x: u64, // collected fee x
    protocol_fee_y: u64, // collected fee y
    // tick data
    ticks: Table<I32, TickInfo>,
    tick_bitmap: Table<I32, u256>,
    // rewards
    reward_infos: vector<PoolRewardInfo>,
    // oracle observations data
    observation_index: u64,
    observation_cardinality: u64,
    observation_cardinality_next: u64,
    observations: vector<Observation>,
    }
```
3. PoolRewardInfo

```move
public struct PoolRewardInfo has copy, drop, store {
    reward_coin_type: TypeName,
    last_update_time: u64,
    ended_at_seconds: u64,
    total_reward: u64,
    total_reward_allocated: u64,
    reward_per_seconds: u128,
    reward_growth_global: u128
    }
```
4. FlashSwapReceipt

```move
public struct FlashSwapReceipt {
    pool_id: ID,
    amount_x_debt: u64,
    amount_y_debt: u64,
    }
```
5. FlashLoanReceipt

```move
public struct FlashLoanReceipt {
    pool_id: ID,
    amount_x: u64,
    amount_y: u64,
    fee_x: u64,
    fee_y: u64,
    }
```

### Function

1. Open position

```move
/// Opens a new position in the given pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool where the position will be opened.
/// - `tick_lower`: The lower tick index for the position.
/// - `tick_upper`: The upper tick index for the position.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A mutable reference to the transaction context.
///
/// # Returns
/// A new `Position` object representing the opened position.
public fun open_position<X, Y>(
    pool: &mut Pool<X, Y>, 
    tick_lower: I32,
    tick_upper: I32,
    version: &Version,
    ctx: &mut TxContext
    ) : Position {}
```
2. Close position

```move
/// Closes an existing position.
/// 
/// # Parameters
/// - `position`: The `Position` object to be closed.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A reference to the transaction context.
public fun close_position(position: Position, version: &Version,  ctx: &TxContext) {}
```

3. Remove liquidity

```move
/// Removes liquidity from the specified position in the given pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool from which liquidity will be removed.
/// - `position`: A mutable reference to the position from which liquidity will be removed.
/// - `liquidity`: The amount of liquidity to be removed.
/// - `min_amount_x`: The minimum amount of coin X to be removed.
/// - `min_amount_y`: The minimum amount of coin Y to be removed.
/// - `clock`: A reference to the clock object to track time.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A mutable reference to the transaction context.
///
/// # Returns
/// A tuple containing the coins of type X and Y that were removed.
 public fun remove_liquidity<X, Y>(
    pool: &mut Pool<X, Y>, 
    position: &mut Position, 
    liquidity: u128, 
    min_amount_x: u64, 
    min_amount_y: u64, 
    clock: &Clock, 
    version: &Version,        
    ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {}
```
4. Add liquidity

```move
/// Adds liquidity to the specified position in the given pool.
/// 
/// # Parameters
/// - `pool`: A mutable reference to the pool where liquidity will be added.
/// - `position`: A mutable reference to the position where liquidity will be added.
/// - `coin_x`: The coin of type X to be added.
/// - `coin_y`: The coin of type Y to be added.
/// - `min_amount_x`: The minimum amount of coin X to be added.
/// - `min_amount_y`: The minimum amount of coin Y to be added.
/// - `clock`: A reference to the clock object to track time.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A mutable reference to the transaction context.
/// 
/// # Returns
/// A tuple containing the remaining coins of type X and Y after adding liquidity.
public fun add_liquidity<X, Y>(
    pool: &mut Pool<X, Y>, 
    position: &mut Position,
    coin_x: Coin<X>,
    coin_y: Coin<Y>,
    min_amount_x: u64,
    min_amount_y: u64,
    clock: &Clock,
    version: &Version,        
    ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {}
```
5. Flash swap

```move
/// Executes a flash swap in the specified pool.
/// 
/// # Parameters
/// - `pool`: A mutable reference to the pool where the flash swap will occur.
/// - `is_x_to_y`: A boolean indicating the direction of the swap (true for X to Y, false for Y to X).
/// - `exact_input`: A boolean indicating whether the input amount is exact.
/// - `amount_specified`: The specified amount for the swap.
/// - `sqrt_price_limit`: The square root price limit for the swap.
/// - `clock`: A reference to the clock object to track time.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A reference to the transaction context.
/// 
/// # Returns
/// A tuple containing the balances of type X and Y, and a `FlashSwapReceipt` object.
public fun flash_swap<X, Y>(
    pool: &mut Pool<X, Y>,
    is_x_to_y: bool,
    exact_input: bool,
    amount_specified: u64,
    sqrt_price_limit: u128,
    clock: &Clock,
    version: &Version,        
    ctx: &TxContext
    ) : (Balance<X>, Balance<Y>, FlashSwapReceipt) {}
```
6. Repay flash swap

```move
/// Repays a flash swap in the specified pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool where the flash swap occurred.
/// - `receipt`: The `FlashSwapReceipt` object representing the flash swap.
/// - `balance_x`: coin X to be repaid.
/// - `balance_y`: coin Y to be repaid.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A reference to the transaction context.
public fun repay_flash_swap<X, Y>(
    pool: &mut Pool<X, Y>,
    receipt: FlashSwapReceipt,
    balance_x: Balance<X>,
    balance_y: Balance<Y>,
    version: &Version,        
    ctx: &TxContext,
    ) {}
```
7. Flash loan

```move
/// Executes a flash loan in the specified pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool where the flash loan will occur.
/// - `amount_x`: The amount of coin X to be loaned.
/// - `amount_y`: The amount of coin Y to be loaned.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A reference to the transaction context.
///
/// # Returns
/// A tuple containing the balances of type X and Y, and a `FlashLoanReceipt` object.
public fun flash_loan<X, Y>(
    pool: &mut Pool<X, Y>,
    amount_x: u64,
    amount_y: u64,
    version: &Version,        
    ctx: &TxContext
    ): (Balance<X>, Balance<Y>, FlashLoanReceipt) {}
```
7. Repay flash loan

```move
/// Repays a flash loan in the specified pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool where the flash loan occurred.
/// - `receipt`: The `FlashLoanReceipt` object representing the flash loan.
/// - `balance_x`: coin X to be repaid.
/// - `balance_y`: coin Y to be repaid.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A reference to the transaction context.
public fun repay_flash_loan<X, Y>(
    pool: &mut Pool<X, Y>,
    receipt: FlashLoanReceipt,
    balance_x: Balance<X>,
    balance_y: Balance<Y>,
    version: &Version,         
    ctx: &TxContext,
    ) {}
```
8. Collect reward

```move
/// Collects the reward for a given position in the specified pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool from which the reward will be collected.
/// - `position`: A mutable reference to the position for which the reward will be collected.
/// - `clock`: A reference to the clock object to track time.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `ctx`: A mutable reference to the transaction context.
///
/// # Returns
/// A coin of type `R` representing the collected reward.
public fun reward<X, Y, R>(
    pool: &mut Pool<X, Y>,  
    position: &mut Position, 
    clock: &Clock, 
    version: &Version,        
    ctx: &mut TxContext
    ) : Coin<R> {}
```
9. Collect fee

```move
/// Collects the fee for a given position in the specified pool.
///
/// # Parameters
/// - `pool`: A mutable reference to the pool from which the fee will be collected.
/// - `position`: A mutable reference to the position for which the fee will be collected.
/// - `clock`: A reference to the clock object to track time.
/// - `version`: A reference to the version object to ensure compatibility.
/// - `tx_context`: A mutable reference to the transaction context.
///
/// # Returns
/// A tuple containing the coins of type X and Y representing the collected fee.
public fun fee<X, Y>(
    pool: &mut Pool<X, Y>, 
    position: &mut Position, 
    clock: &Clock, 
    version: &Version,
    tx_context: &mut TxContext
    ) : (Coin<X>, Coin<Y>) {}
```

