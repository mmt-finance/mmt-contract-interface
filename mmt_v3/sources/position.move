module mmt_v3::position {
    use std::type_name::{TypeName};
    use mmt_v3::i32::{I32};

    #[allow(unused_field)]
    public struct POSITION has drop {
        dummy_field: bool,
    }
    
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
    
    public struct PositionRewardInfo has copy, drop, store {
        reward_growth_inside_last: u128,
        coins_owed_reward: u64,
    }

    fun init(dummy_position: POSITION, tx_context: &mut TxContext) {
        abort 0
    }

    // --- Public Functions ---
    public fun coins_owed_reward(position: &Position, reward_index: u64) : u64 {
        abort 0
    }

    // returns if position does not have claimable rewards.
    public fun is_empty(position: &Position) : bool {
        abort 0
    }
    
    public fun reward_growth_inside_last(position: &Position, reward_index: u64) : u128 {
        abort 0
    }
    
    // public getter functions
    public fun reward_length(position: &Position) : u64 { abort 0 }
    public fun tick_lower_index(position: &Position) : I32 { abort 0 }
    public fun tick_upper_index(position: &Position) : I32 { abort 0 }
    public fun liquidity(position: &Position) : u128 { abort 0 }
    public fun owed_coin_x(position: &Position) : u64 { abort 0 }
    public fun owed_coin_y(position: &Position) : u64 { abort 0 }
    public fun fee_growth_inside_x_last(position: &Position) : u128 { abort 0 }
    public fun fee_growth_inside_y_last(position: &Position) : u128 { abort 0 }
    public fun fee_rate(position: &Position) : u64 { abort 0 }
    public fun pool_id(position: &Position) : ID { abort 0 }
}
