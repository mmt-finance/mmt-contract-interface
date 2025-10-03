module mmt_v3::global_config {
    
    use sui::table::{Table};

    public struct EnableFeeRateEvent has copy, drop, store {
        sender: address,
        fee_rate: u64,
        tick_spacing: u32,
    }
    
    public struct GlobalConfig has key, store {
        id: UID,
        fee_amount_tick_spacing: Table<u64, u32>
    }

    fun init(tx_context: &mut TxContext) {
        abort 0
    }

    public fun contains_fee_rate(self: &GlobalConfig, fee_rate: u64): bool { abort 0 }

    public fun get_tick_spacing(self: &GlobalConfig, fee_rate: u64): u32 {
        abort 0
    }
}
