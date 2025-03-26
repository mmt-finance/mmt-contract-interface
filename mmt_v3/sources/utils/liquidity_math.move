module mmt_v3::liquidity_math {
    use mmt_v3::i128::{I128};

    public fun add_delta(current_liquidity: u128, delta_liquidity: I128) : u128 {
        abort 0
    }
    
    // get amount x for delta liquidity
    public fun get_amount_x_for_liquidity(sqrt_price_current: u128, sqrt_price_target: u128, liquidity: u128, round_up: bool) : u64 {
        abort 0
    }
    
    // get amount y for delta liquidity.
    public fun get_amount_y_for_liquidity(sqrt_price_current: u128, sqrt_price_target: u128, liquidity: u128, round_up: bool) : u64 {
        abort 0
    }
    
    // returns amounts of both assets as per delta liquidity.
    public fun get_amounts_for_liquidity(
        sqrt_price_current: u128, 
        sqrt_price_lower: u128, 
        sqrt_price_upper: u128, 
        liquidity: u128, 
        round_up: bool
    ) : (u64, u64) {
        abort 0
    }
    
    // get delta liquidity by amount x.
    public fun get_liquidity_for_amount_x(sqrt_price_current: u128, sqrt_price_target: u128, amount_x: u64) : u128 {
        abort 0
    }
    
    // get delta liquidity by amount y.
    public fun get_liquidity_for_amount_y(sqrt_price_current: u128, sqrt_price_target: u128, amount_y: u64) : u128 {
        abort 0
    }
    
    // returns liquidity from amounts x & y.
    public fun get_liquidity_for_amounts(sqrt_price_current: u128, sqrt_price_lower: u128, sqrt_price_upper: u128, amount_x: u64, amount_y: u64) : u128 {
        abort 0
    }

    public fun check_is_fix_coin_a(
        lower_sqrt_price: u128,
        upper_sqrt_price: u128,
        current_sqrt_price: u128,
        amount_a: u64,
        amount_b: u64
    ): (bool, u64, u64) {
        abort 0
    }
}
