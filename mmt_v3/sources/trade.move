module mmt_v3::trade {
    use sui::balance::{Balance};
    use sui::clock::{Clock};
    use mmt_v3::pool::{Pool};
    use mmt_v3::i32::{Self, I32};
    use mmt_v3::version::{Version};
    use mmt_v3::position::{Position};

    const Factor: u128 = 18446744073709551616; // 2^64 (64 bit notation)

    // FlashLoanEvent flash_swap & loan receipt hot potatoes.
    public struct FlashSwapReceipt {
        pool_id: ID,
        amount_x_debt: u64,
        amount_y_debt: u64,
    }

    public struct FlashLoanReceipt {
        pool_id: ID,
        amount_x: u64,
        amount_y: u64,
        fee_x: u64,
        fee_y: u64,
    }

    // flash_swap state & computations structs
    public struct SwapState has copy, drop {
        amount_specified_remaining: u64,
        amount_calculated: u64,
        sqrt_price: u128,
        tick_index: I32,
        fee_growth_global: u128,
        protocol_fee: u64,
        liquidity: u128,
        fee_amount: u64
    }

    public struct SwapStepComputations has copy, drop {
        sqrt_price_start: u128,
        tick_index_next: i32::I32,
        initialized: bool,
        sqrt_price_next: u128,
        amount_in: u64,
        amount_out: u64,
        fee_amount: u64,
    }

    // Events
    public struct SwapEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        x_for_y: bool,
        amount_x: u64,
        amount_y: u64,
        sqrt_price_before: u128,
        sqrt_price_after: u128,
        liquidity: u128,
        tick_index: i32::I32,
        fee_amount: u64,
        protocol_fee: u64,
        reserve_x: u64,
        reserve_y: u64
    }

    public struct RepayFlashLoanEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        amount_x_debt: u64,
        amount_y_debt: u64,
        actual_fee_paid_x: u64,
        actual_fee_paid_y: u64,
        reserve_x: u64,
        reserve_y: u64,
        fee_x: u64,
        fee_y: u64
    }

    public struct RepayFlashSwapEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        amount_x_debt: u64,
        amount_y_debt: u64,
        paid_x: u64,
        paid_y: u64,
        reserve_x: u64,
        reserve_y: u64
    }

    public struct FlashLoanEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        amount_x: u64,
        amount_y: u64,
        reserve_x: u64,
        reserve_y: u64
    }

    public fun flash_swap<X, Y>(
        pool: &mut Pool<X, Y>,
        is_x_to_y: bool,
        exact_input: bool,
        amount_specified: u64,
        sqrt_price_limit: u128,
        clock: &Clock,
        version: &Version,        
        ctx: &TxContext
    ) : (Balance<X>, Balance<Y>, FlashSwapReceipt) {
        abort 0
    }

    public fun repay_flash_swap<X, Y>(
        pool: &mut Pool<X, Y>,
        receipt: FlashSwapReceipt,
        balance_x: Balance<X>,
        balance_y: Balance<Y>,
        version: &Version,        
        ctx: &TxContext,
    ) {
        abort 0
    }

    public fun flash_loan<X, Y>(
        pool: &mut Pool<X, Y>,
        amount_x: u64,
        amount_y: u64,
        version: &Version,        
        ctx: &TxContext
    ): (Balance<X>, Balance<Y>, FlashLoanReceipt) {
        abort 0
    }

    public fun repay_flash_loan<X, Y>(
        pool: &mut Pool<X, Y>,
        receipt: FlashLoanReceipt,
        balance_x: Balance<X>,
        balance_y: Balance<Y>,
        version: &Version,         
        ctx: &TxContext,
    ) {
        abort 0
    }

    public fun flash_receipt_debts(
        receipt: &FlashLoanReceipt,
    ): (u64, u64) {
        abort 0
    }

    public fun swap_receipt_debts(
        receipt: &FlashSwapReceipt,
    ): (u64, u64) {
        abort 0
    }

    public fun compute_swap_result_max<X, Y>(
        pool: &Pool<X, Y>,
        is_x_to_y: bool,
        exact_input: bool,
        sqrt_price_limit: u128
    ): SwapState {
        abort 0
    }

    public fun compute_swap_result<X, Y>(
        pool: &Pool<X, Y>,
        is_x_to_y: bool,
        exact_input: bool,
        sqrt_price_limit: u128,
        amount_specified: u64
    ): SwapState {
        abort 0
    }

    public fun get_optimal_swap_amount_for_single_sided_liquidity<A, B>(
        pool: &Pool<A,B>, 
        amount: u64,
        position: &Position, 
        sqrt_price_limit: u128,
        is_a: bool, 
        max_iterations: u64
    ): (u64, bool) {
        abort 0
    }

    // flash_swap state getter & setter functions
    public fun get_state_amount_specified(state: &SwapState): u64 { abort 0 }
    public fun get_state_amount_calculated(state: &SwapState): u64 { abort 0 }
    public fun get_state_sqrt_price(state: &SwapState): u128 { abort 0 }
    public fun get_state_tick_index(state: &SwapState): I32 { abort 0 }
    public fun get_state_fee_growth_global(state: &SwapState): u128 { abort 0 }
    public fun get_state_protocol_fee(state: &SwapState): u64 { abort 0 }
    public fun get_state_liquidity(state: &SwapState): u128 { abort 0 }
    public fun get_state_fee_amount(state: &SwapState): u64 { abort 0 }

    // flash_swap step getter & setter functions
    public fun get_step_sqrt_price_start(state: &SwapStepComputations): u128 { abort 0 }
    public fun get_step_tick_index_next(state: &SwapStepComputations): I32 { abort 0 }
    public fun get_step_sqrt_price_next(state: &SwapStepComputations): u128 { abort 0 }
    public fun get_step_initialized(state: &SwapStepComputations): bool { abort 0 }
    public fun get_step_amount_in(state: &SwapStepComputations): u64 { abort 0 }
    public fun get_step_amount_out(state: &SwapStepComputations): u64 { abort 0 }
    public fun get_step_fee_amount(state: &SwapStepComputations): u64 { abort 0 }

    fun closer(a: u128, b: u128, target: u128): bool {
        abort 0
    }
}