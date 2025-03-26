module mmt_v3::utils {
    use sui::coin::{Self, Coin};
    
    public fun refund<X>(coin: Coin<X>, recipient: address) {
        abort 0
    }
    
    public fun to_seconds(milliseconds: u64) : u64 {
        abort 0
    }
}
