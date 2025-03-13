module mmt_v3::liquidity {
    use sui::coin::{Self, Coin};
    use sui::clock::{Clock};
    use mmt_v3::pool::{Self, Pool};
    use mmt_v3::position::{Self, Position};
    use mmt_v3::i32::{I32};
    use mmt_v3::version::{Self,Version};    

    public struct OpenPositionEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        position_id: ID,
        tick_lower_index: I32,
        tick_upper_index: I32,
    }
    
    public struct ClosePositionEvent has copy, drop, store {
        sender: address,
        position_id: ID,
    }
    
    public struct AddLiquidityEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        position_id: ID,
        liquidity: u128,
        amount_x: u64,
        amount_y: u64,
        upper_tick_index: I32,
        lower_tick_index: I32,
        reserve_x: u64,
        reserve_y: u64
    }
    
    public struct RemoveLiquidityEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        position_id: ID,
        liquidity: u128,
        amount_x: u64,
        amount_y: u64,
        upper_tick_index: I32,
        lower_tick_index: I32,
        reserve_x: u64,
        reserve_y: u64
    }

    public fun open_position<X, Y>(
        pool: &mut Pool<X, Y>, 
        tick_lower: I32,
        tick_upper: I32,
        version: &Version,
        ctx: &mut TxContext
    ) : Position {
        abort 0
    }
    
    public fun close_position(position: Position, version: &Version,  ctx: &TxContext) {
        abort 0
    }
    
    public fun remove_liquidity<X, Y>(
        pool: &mut Pool<X, Y>, 
        position: &mut Position, 
        liquidity: u128, 
        min_amount_x: u64, 
        min_amount_y: u64, 
        clock: &Clock, 
        version: &Version,        
        ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {
        abort 0
    }
    
    // adds liquidity and returns refund amount if any.
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
    ): (Coin<X>, Coin<Y>) {
        abort 0
    }
}
