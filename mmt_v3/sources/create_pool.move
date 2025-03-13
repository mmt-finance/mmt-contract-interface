module mmt_v3::create_pool {
    use std::type_name::{TypeName};
    use mmt_v3::pool::{ Pool};
    use mmt_v3::global_config::{GlobalConfig};
    use mmt_v3::version::{Version};

    public struct PoolCreatedEvent has copy, drop, store {
        sender: address,
        pool_id: ID,
        type_x: TypeName,
        type_y: TypeName,
        fee_rate: u64,
        tick_spacing: u32,
    }

    #[allow(lint(share_owned))]
    public fun new<X, Y>(
        global_config: &mut GlobalConfig,
        fee_rate: u64,
        version: &Version,        
        tx_context: &mut TxContext
    ): Pool<X, Y> {
        abort 0
    }
    
    fun create_pool_internal<X, Y>(
        global_config: &GlobalConfig,
        fee_rate: u64,
        version: &Version,        
        tx_context: &mut TxContext
    ): Pool<X, Y> {
        abort 0
    }
}