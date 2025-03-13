module mmt_v3::tick {
    use sui::table::{Table};
    use mmt_v3::i128::{I128};
    use mmt_v3::i32::{I32};
    use mmt_v3::i64::{I64};
    
    public struct TickInfo has copy, drop, store {
        liquidity_gross: u128,
        liquidity_net: I128,
        fee_growth_outside_x: u128,
        fee_growth_outside_y: u128,
        reward_growths_outside: vector<u128>,
        tick_cumulative_out_side: I64,
        seconds_per_liquidity_out_side: u256,
        seconds_out_side: u64,
    }

    // --- Public Functions ---

    // assert ticks
    public fun verify_tick(tick_lower: I32, tick_upper: I32, tick_spacing: u32) {
        abort 0
    }

    public fun get_fee_and_reward_growths_inside(tick_table: &Table<I32, TickInfo>, tick_lower: I32, tick_upper: I32, current_tick: I32, fee_growth_global_x: u128, fee_growth_global_y: u128, reward_growths: vector<u128>) : (u128, u128, vector<u128>) {
        abort 0    }
    
    public fun get_fee_and_reward_growths_outside(tick_table: &Table<I32, TickInfo>, tick_index: I32) : (u128, u128, vector<u128>) {
        abort 0
    }
    
    public fun get_liquidity_gross(tick_table: &Table<I32, TickInfo>, tick_index: I32) : u128 {
        abort 0
    }
    
    public fun get_liquidity_net(tick_table: &Table<I32, TickInfo>, tick_index: I32) : I128 {
        abort 0
    }
    
    public fun get_seconds_out_side(tick_table: &Table<I32, TickInfo>, tick_index: I32) : u64 {
        abort 0
    }
    
    public fun get_seconds_per_liquidity_out_side(tick_table: &Table<I32, TickInfo>, tick_index: I32) : u256 {
        abort 0
    }
    
    public fun get_tick_cumulative_out_side(tick_table: &Table<I32, TickInfo>, tick_index: I32) : I64 {
        abort 0
    }
    
    public fun is_initialized(tick_table: &Table<I32, TickInfo>, tick_index: I32) : bool { abort 0 }
    
    public fun tick_spacing_to_max_liquidity_per_tick(tick_spacing: u32) : u128 {
        abort 0
    }
}
