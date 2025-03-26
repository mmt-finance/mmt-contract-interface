module mmt_v3::oracle {
    use mmt_v3::i32::{I32};
    use mmt_v3::i64::{Self, I64};

    public struct Observation has copy, drop, store {
        timestamp_s: u64,
        tick_cumulative: I64,
        seconds_per_liquidity_cumulative: u256,
        initialized: bool,
    }
    
    #[allow(unused_assignment)]
    public fun binary_search(
        observations: &vector<Observation>, 
        target_timestamp: u64, 
        start_index: u64, 
        length: u64
    ) : (Observation, Observation) {
        abort 0
    }
    
    public fun get_surrounding_observations(
        observations: &vector<Observation>, 
        target_timestamp: u64, 
        tick_difference: I32, 
        start_index: u64, 
        length: u128, 
        observation_cardinality: u64
    ) : (Observation, Observation) {
        abort 0
    }
    
    public fun grow(observations: &mut vector<Observation>, mut current_size: u64, new_size: u64) : u64 {
        abort 0
    }
    
    public fun initialize(observations: &mut vector<Observation>, timestamp: u64) : (u64, u64) {
        abort 0
    }
    
    public fun is_initialized(observation: &Observation) : bool {
        abort 0
    }
    
    public fun observe(
        observations: &vector<Observation>, 
        timestamp: u64, 
        intervals: vector<u64>, 
        tick_difference: I32, 
        start_index: u64, 
        liquidity: u128, 
        total_observations: u64
    ) : (vector<I64>, vector<u256>) {
        abort 0
    }
    
    public fun observe_single(
        observations: &vector<Observation>, 
        timestamp: u64, 
        interval: u64, 
        tick_difference: I32, 
        start_index: u64, 
        liquidity: u128, 
        observation_cardinality: u64
    ) : (I64, u256) {
        abort 0
    }
    
    public fun seconds_per_liquidity_cumulative(observation: &Observation) : u256 {
        abort 0
    }
    
    public fun tick_cumulative(observation: &Observation) : I64 {
        abort 0
    }
    
    public fun timestamp_s(observation: &Observation) : u64 {
        abort 0
    }
    
    public fun transform(
        observation: &Observation, 
        timestamp: u64, 
        tick_difference: I32, 
        liquidity: u128
    ) : Observation {
        abort 0
    }
    
    public fun write(
        observations: &mut vector<Observation>, 
        observation_index: u64, 
        timestamp: u64, 
        tick_difference: I32, 
        liquidity: u128, 
        observation_cardinality: u64, 
        observation_cardinality_next: u64
    ) : (u64, u64) {
        abort 0
    }
    
    
}
