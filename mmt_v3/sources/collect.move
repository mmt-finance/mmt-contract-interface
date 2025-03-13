module mmt_v3::collect {
    use sui::coin::{Coin};
    use sui::clock::{Clock};
    use mmt_v3::pool::{Pool};
    use mmt_v3::position::{Position};
    use std::type_name::{TypeName};
    use mmt_v3::version::{Version};

    public struct FeeCollectedEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        position_id: ID,
        amount_x: u64,
        amount_y: u64,
    }

    public struct CollectPoolRewardEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        position_id: ID,
        reward_coin_type: TypeName,
        amount: u64,
    }

    public fun fee<X, Y>(
        pool: &mut Pool<X, Y>, 
        position: &mut Position, 
        clock: &Clock, 
        version: &Version,
        tx_context: &mut TxContext
    ) : (Coin<X>, Coin<Y>) {
        abort 0
    }
    
    public fun reward<X, Y, R>(
        pool: &mut Pool<X, Y>,  
        position: &mut Position, 
        clock: &Clock, 
        version: &Version,        
        ctx: &mut TxContext
    ) : Coin<R> {
        abort 0
    }
}