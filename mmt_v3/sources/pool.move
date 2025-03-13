module mmt_v3::pool {

    // ----- Use Statements -----

    use sui::clock::{Clock};
    use std::type_name::{TypeName};
    use mmt_v3::i32::{I32};
    use mmt_v3::tick::{TickInfo};
    use mmt_v3::oracle::{Observation};
    use sui::balance::{Balance};
    use mmt_v3::i64;
    use sui::table::{Table};

    // ----- public structs -----

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

    public struct PoolRewardInfo has copy, drop, store {
        reward_coin_type: TypeName,
        last_update_time: u64,
        ended_at_seconds: u64,
        total_reward: u64,
        total_reward_allocated: u64,
        reward_per_seconds: u128,
        reward_growth_global: u128
    }

    public struct PoolRewardCustodianDfKey<phantom X> has copy, drop, store {
        dummy_field: bool,
    }

    // events
    
    public struct ObservationCardinalityUpdatedEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        observation_cardinality_next_old: u64,
        observation_cardinality_next_new: u64,
    }

    public struct UpdatePoolRewardEmissionEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        reward_coin_type: TypeName,
        total_reward: u64,
        ended_at_seconds: u64,
        reward_per_seconds: u128,
    }

    public struct PoolPausedEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        type_x: TypeName,
        type_y: TypeName,
        paused: bool,
    }

    public struct ToggleTradingEvent has copy, drop, store {
        pool_id: ID, 
        toggle_trading: bool,
    }

    // ----- Public Functions -----

    public fun initialize<X, Y>(
        pool: &mut Pool<X, Y>,
        sqrt_price: u128,
        clock: &Clock
    ) {
        abort 0
    }

    public fun verify_pool<X, Y>(
        pool: &Pool<X, Y>,
        id: ID,
    ) {
        abort 0
    }

    #[allow(lint(share_owned))]
    public fun transfer<X, Y>(self: Pool<X, Y>) {
        abort 0
    }

    public fun borrow_observations<X, Y>(pool: &Pool<X, Y>): &vector<Observation> { abort 0 }
    public fun borrow_tick_bitmap<X, Y>(pool: &Pool<X, Y>): &Table<I32, u256> { abort 0 }
    public fun borrow_ticks<X, Y>(pool: &Pool<X, Y>): &Table<I32, TickInfo> { abort 0 }

    public fun get_reserves<X, Y>(
        pool: &Pool<X, Y>
    ): (u64, u64) {
        abort 0
    }
    
    // pool getters
    public fun type_x<X, Y>(pool: &Pool<X, Y>): TypeName { abort 0 }
    public fun type_y<X, Y>(pool: &Pool<X, Y>): TypeName { abort 0 }
    public fun liquidity<X, Y>(pool: &Pool<X, Y>): u128 { abort 0 }
    public fun sqrt_price<X, Y>(self: &Pool<X, Y>) : u128 { abort 0 }
    public fun tick_index_current<X, Y>(pool: &Pool<X, Y>) : I32 { abort 0 }
    public fun tick_spacing<X, Y>(pool: &Pool<X, Y>) : u32 { abort 0 }
    public fun max_liquidity_per_tick<X, Y>(pool: &Pool<X, Y>): u128 { abort 0 }
    public fun observation_cardinality<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun observation_cardinality_next<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun observation_index<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun pool_id<X, Y>(pool: &Pool<X, Y>): ID { abort 0 }
    public fun swap_fee_rate<X, Y>(self: &Pool<X, Y>) : u64 { abort 0 }
    public fun flash_loan_fee_rate<X, Y>(self: &Pool<X, Y>) : u64 { abort 0 }
    public fun protocol_fee_share<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun protocol_flash_loan_fee_share<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun protocol_fee_x<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun protocol_fee_y<X, Y>(pool: &Pool<X, Y>): u64 { abort 0 }
    public fun reserves<X, Y>(pool: &Pool<X, Y>): (u64, u64) { abort 0 }
    public fun reward_coin_type<X, Y>(pool: &Pool<X, Y>, index: u64): TypeName { abort 0 }
    public fun fee_growth_global_x<X, Y>(pool: &Pool<X, Y>): u128 { abort 0 }
    public fun fee_growth_global_y<X, Y>(pool: &Pool<X, Y>): u128 { abort 0 }

    // oracle public functions
    public fun observe<X, Y>(
        pool: &Pool<X, Y>,
        seconds_ago: vector<u64>,
        clock: &Clock
    ): (vector<i64::I64>, vector<u256>) {
        abort 0
    }

    // rewards getters
    public fun total_reward<X, Y>(pool: &Pool<X, Y>, reward_id: u64) : u64 { abort 0 }
    public fun total_reward_allocated<X, Y>(pool: &Pool<X, Y>, reward_id: u64) : u64 { abort 0 }
    public fun reward_ended_at<X, Y>(pool: &Pool<X, Y>, reward_index: u64): u64 { abort 0 }
    public fun reward_growth_global<X, Y>(pool: &Pool<X, Y>, timestamp: u64): u128 { abort 0 }
    public fun reward_last_update_at<X, Y>(pool: &Pool<X, Y>, reward_index: u64): u64 { abort 0 }
    public fun reward_per_seconds<X, Y>(pool: &Pool<X, Y>, timestamp: u64): u128 { abort 0 }
    public fun reward_length<X, Y>(pool: &Pool<X, Y>): u64 {abort 0}
    public fun reward_info_at<X, Y>(pool: &Pool<X, Y>, index: u64): &PoolRewardInfo {
        abort 0
    }

    // returns friendly ticks by adjusting tick spacing of the pool.
    public fun get_friendly_ticks<X, Y>(
        pool: &Pool<X, Y>, 
        lower_sqrt_price: u128, 
        upper_sqrt_price: u128
    ): (I32, I32) {
        abort 0
    }



    fun find_reward_info_index<X, Y, R>(
        pool: &Pool<X, Y>
    ): u64 {
        abort 0
    }

    fun safe_withdraw<X>(balance: &mut Balance<X>, amount: u64) : Balance<X> {
        abort 0
    }
}