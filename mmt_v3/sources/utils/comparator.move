module mmt_v3::comparator {

    public struct Result has drop {
        inner: u8,
    }
    
    public fun compare<X>(value1: &X, value2: &X) : Result {
        abort 0
    }
    
    public fun compare_u8_vector(vec1: vector<u8>, vec2: vector<u8>) : Result {
        abort 0
    }
    
    public fun is_equal(result: &Result) : bool {
        abort 0
    }
    
    public fun is_greater_than(result: &Result) : bool {
        abort 0
    }
    
    public fun is_smaller_than(result: &Result) : bool {
        abort 0
    }
}
