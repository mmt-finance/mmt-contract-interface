module mmt_v3::sqrt_price_math {
    public fun get_amount_x_delta(
        sqrt_price_start: u128, 
        sqrt_price_end: u128, 
        liquidity: u128, 
        round_up: bool
    ) : u64 {
        abort 0
    }
    
    public fun get_amount_y_delta(sqrt_price_start: u128, sqrt_price_end: u128, liquidity: u128, round_up: bool) : u64 {
        abort 0
    }
    
    public fun get_next_sqrt_price_from_amount_x_rouding_up(current_price: u128, liquidity: u128, amount: u64, round_up: bool) : u128 {
        abort 0
    }
    
    public fun get_next_sqrt_price_from_amount_y_rouding_down(current_price: u128, liquidity: u128, amount: u64, round_up: bool) : u128 {
        abort 0
    }
    
    public fun get_next_sqrt_price_from_input(current_price: u128, liquidity: u128, amount: u64, is_token0: bool) : u128 {
        abort 0
    }
    
    public fun get_next_sqrt_price_from_output(current_price: u128, liquidity: u128, amount: u64, is_token0: bool) : u128 {
        abort 0
    }
    
    
}
