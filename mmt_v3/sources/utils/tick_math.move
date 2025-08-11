module mmt_v3::tick_math {
    use mmt_v3::i32::{I32};
    
    public fun get_sqrt_price_at_tick(tick_index: I32) : u128 {
        abort 0
    }
    
    public fun get_tick_at_sqrt_price(sqrt_price: u128) : I32 {
        abort 0
    }
    
    public fun is_valid_index(tick_index: I32, tick_spacing: u32) : bool {
        abort 0
    }
    
    public fun max_sqrt_price() : u128 {
        abort 0
    }
    
    public fun max_tick() : I32 {
        abort 0
    }
    
    public fun min_sqrt_price() : u128 {
        abort 0
    }
    
    public fun min_tick() : I32 {
        abort 0
    }
    
    public fun tick_bound() : u32 {
        abort 0
    }
}

