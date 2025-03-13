module mmt_v3::i32 {
    const EOverflow: u64 = 0;

    const MIN_AS_U32: u32 = 1 << 31;
    const MAX_AS_U32: u32 = 0x7fffffff;

    const LT: u8 = 0;
    const EQ: u8 = 1;
    const GT: u8 = 2;

    public struct I32 has copy, drop, store {
        bits: u32
    }

    public fun zero(): I32 {
        abort 0
    }

    public fun from_u32(v: u32): I32 {
        abort 0
    }

    public fun from(v: u32): I32 {
        abort 0
    }

    public fun neg_from(v: u32): I32 {
        abort 0
    }

    public fun wrapping_add(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun add(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun wrapping_sub(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun sub(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun mul(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun div(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun abs(v: I32): I32 {
        abort 0
    }

    public fun abs_u32(v: I32): u32 {
        abort 0
    }

    public fun shl(v: I32, shift: u8): I32 {
        abort 0
    }

    public fun shr(v: I32, shift: u8): I32 {
        abort 0
    }

    public fun mod(v: I32, n: I32): I32 {
        abort 0
    }

    public fun as_u32(v: I32): u32 {
        abort 0
    }

    public fun sign(v: I32): u8 {
        abort 0
    }

    public fun is_neg(v: I32): bool {
        abort 0
    }

    public fun cmp(num1: I32, num2: I32): u8 {
        abort 0
    }

    public fun eq(num1: I32, num2: I32): bool {
        abort 0
    }

    public fun gt(num1: I32, num2: I32): bool {
        abort 0
    }

    public fun gte(num1: I32, num2: I32): bool {
        abort 0
    }

    public fun lt(num1: I32, num2: I32): bool {
        abort 0
    }

    public fun lte(num1: I32, num2: I32): bool {
        abort 0
    }

    public fun or(num1: I32, num2: I32): I32 {
        abort 0
    }

    public fun and(num1: I32, num2: I32): I32 {
        abort 0
    }

    fun u32_neg(v: u32): u32 {
        abort 0
    }

    fun u8_neg(v: u8): u8 {
        abort 0
    }

    #[test]
    fun test_from_ok() {
        assert!(as_u32(from(0)) == 0, 0);
        assert!(as_u32(from(10)) == 10, 1);
    }

    #[test]
    #[expected_failure]
    fun test_from_overflow() {
        as_u32(from(MIN_AS_U32));
        as_u32(from(0xffffffff));
    }

    #[test]
    fun test_neg_from() {
        assert!(as_u32(neg_from(0)) == 0, 0);
        assert!(as_u32(neg_from(1)) == 0xffffffff, 1);
        assert!(as_u32(neg_from(0x7fffffff)) == 0x80000001, 2);
        assert!(as_u32(neg_from(MIN_AS_U32)) == MIN_AS_U32, 2);
    }

    #[test]
    #[expected_failure]
    fun test_neg_from_overflow() {
        neg_from(0x80000001);
    }

    #[test]
    fun test_abs() {
        assert!(as_u32(from(10)) == 10u32, 0);
        assert!(as_u32(abs(neg_from(10))) == 10u32, 1);
        assert!(as_u32(abs(neg_from(0))) == 0u32, 2);
        assert!(as_u32(abs(neg_from(0x7fffffff))) == 0x7fffffff, 3);
        assert!(as_u32(neg_from(MIN_AS_U32)) == MIN_AS_U32, 4);
    }

    #[test]
    #[expected_failure]
    fun test_abs_overflow() {
        abs(neg_from(1 << 31));
    }

    #[test]
    fun test_wrapping_add() {
        assert!(as_u32(wrapping_add(from(0), from(1))) == 1, 0);
        assert!(as_u32(wrapping_add(from(1), from(0))) == 1, 0);
        assert!(as_u32(wrapping_add(from(10000), from(99999))) == 109999, 0);
        assert!(as_u32(wrapping_add(from(99999), from(10000))) == 109999, 0);
        assert!(as_u32(wrapping_add(from(MAX_AS_U32 - 1), from(1))) == MAX_AS_U32, 0);
        assert!(as_u32(wrapping_add(from(0), from(0))) == 0, 0);

        assert!(as_u32(wrapping_add(neg_from(0), neg_from(0))) == 0, 1);
        assert!(as_u32(wrapping_add(neg_from(1), neg_from(0))) == 0xffffffff, 1);
        assert!(as_u32(wrapping_add(neg_from(0), neg_from(1))) == 0xffffffff, 1);
        assert!(as_u32(wrapping_add(neg_from(10000), neg_from(99999))) == 0xfffe5251, 1);
        assert!(as_u32(wrapping_add(neg_from(99999), neg_from(10000))) == 0xfffe5251, 1);
        assert!(as_u32(wrapping_add(neg_from(MIN_AS_U32 - 1), neg_from(1))) == MIN_AS_U32, 1);

        assert!(as_u32(wrapping_add(from(0), neg_from(0))) == 0, 2);
        assert!(as_u32(wrapping_add(neg_from(0), from(0))) == 0, 2);
        assert!(as_u32(wrapping_add(neg_from(1), from(1))) == 0, 2);
        assert!(as_u32(wrapping_add(from(1), neg_from(1))) == 0, 2);
        assert!(as_u32(wrapping_add(from(10000), neg_from(99999))) == 0xfffea071, 2);
        assert!(as_u32(wrapping_add(from(99999), neg_from(10000))) == 89999, 2);
        assert!(as_u32(wrapping_add(neg_from(MIN_AS_U32), from(1))) == 0x80000001, 2);
        assert!(as_u32(wrapping_add(from(MAX_AS_U32), neg_from(1))) == MAX_AS_U32 - 1, 2);

        assert!(as_u32(wrapping_add(from(MAX_AS_U32), from(1))) == MIN_AS_U32, 2);
    }

    #[test]
    fun test_add() {
        assert!(as_u32(add(from(0), from(0))) == 0, 0);
        assert!(as_u32(add(from(0), from(1))) == 1, 0);
        assert!(as_u32(add(from(1), from(0))) == 1, 0);
        assert!(as_u32(add(from(10000), from(99999))) == 109999, 0);
        assert!(as_u32(add(from(99999), from(10000))) == 109999, 0);
        assert!(as_u32(add(from(MAX_AS_U32 - 1), from(1))) == MAX_AS_U32, 0);

        assert!(as_u32(add(neg_from(0), neg_from(0))) == 0, 1);
        assert!(as_u32(add(neg_from(1), neg_from(0))) == 0xffffffff, 1);
        assert!(as_u32(add(neg_from(0), neg_from(1))) == 0xffffffff, 1);
        assert!(as_u32(add(neg_from(10000), neg_from(99999))) == 0xfffe5251, 1);
        assert!(as_u32(add(neg_from(99999), neg_from(10000))) == 0xfffe5251, 1);
        assert!(as_u32(add(neg_from(MIN_AS_U32 - 1), neg_from(1))) == MIN_AS_U32, 1);

        assert!(as_u32(add(from(0), neg_from(0))) == 0, 2);
        assert!(as_u32(add(neg_from(0), from(0))) == 0, 2);
        assert!(as_u32(add(neg_from(1), from(1))) == 0, 2);
        assert!(as_u32(add(from(1), neg_from(1))) == 0, 2);
        assert!(as_u32(add(from(10000), neg_from(99999))) == 0xfffea071, 2);
        assert!(as_u32(add(from(99999), neg_from(10000))) == 89999, 2);
        assert!(as_u32(add(neg_from(MIN_AS_U32), from(1))) == 0x80000001, 2);
        assert!(as_u32(add(from(MAX_AS_U32), neg_from(1))) == MAX_AS_U32 - 1, 2);
    }

    #[test]
    #[expected_failure]
    fun test_add_overflow() {
        add(from(MAX_AS_U32), from(1));
    }

    #[test]
    #[expected_failure]
    fun test_add_underflow() {
        add(neg_from(MIN_AS_U32), neg_from(1));
    }

    #[test]
    fun test_wrapping_sub() {
        assert!(as_u32(wrapping_sub(from(0), from(0))) == 0, 0);
        assert!(as_u32(wrapping_sub(from(1), from(0))) == 1, 0);
        assert!(as_u32(wrapping_sub(from(0), from(1))) == as_u32(neg_from(1)), 0);
        assert!(as_u32(wrapping_sub(from(1), from(1))) == as_u32(neg_from(0)), 0);
        assert!(as_u32(wrapping_sub(from(1), neg_from(1))) == as_u32(from(2)), 0);
        assert!(as_u32(wrapping_sub(neg_from(1), from(1))) == as_u32(neg_from(2)), 0);
        assert!(as_u32(wrapping_sub(from(1000000), from(1))) == 999999, 0);
        assert!(as_u32(wrapping_sub(neg_from(1000000), neg_from(1))) == as_u32(neg_from(999999)), 0);
        assert!(as_u32(wrapping_sub(from(1), from(1000000))) == as_u32(neg_from(999999)), 0);
        assert!(as_u32(wrapping_sub(from(MAX_AS_U32), from(MAX_AS_U32))) == as_u32(from(0)), 0);
        assert!(as_u32(wrapping_sub(from(MAX_AS_U32), from(1))) == as_u32(from(MAX_AS_U32 - 1)), 0);
        assert!(as_u32(wrapping_sub(from(MAX_AS_U32), neg_from(1))) == as_u32(neg_from(MIN_AS_U32)), 0);
        assert!(as_u32(wrapping_sub(neg_from(MIN_AS_U32), neg_from(1))) == as_u32(neg_from(MIN_AS_U32 - 1)), 0);
        assert!(as_u32(wrapping_sub(neg_from(MIN_AS_U32), from(1))) == as_u32(from(MAX_AS_U32)), 0);
    }

    #[test]
    fun test_sub() {
        assert!(as_u32(sub(from(0), from(0))) == 0, 0);
        assert!(as_u32(sub(from(1), from(0))) == 1, 0);
        assert!(as_u32(sub(from(0), from(1))) == as_u32(neg_from(1)), 0);
        assert!(as_u32(sub(from(1), from(1))) == as_u32(neg_from(0)), 0);
        assert!(as_u32(sub(from(1), neg_from(1))) == as_u32(from(2)), 0);
        assert!(as_u32(sub(neg_from(1), from(1))) == as_u32(neg_from(2)), 0);
        assert!(as_u32(sub(from(1000000), from(1))) == 999999, 0);
        assert!(as_u32(sub(neg_from(1000000), neg_from(1))) == as_u32(neg_from(999999)), 0);
        assert!(as_u32(sub(from(1), from(1000000))) == as_u32(neg_from(999999)), 0);
        assert!(as_u32(sub(from(MAX_AS_U32), from(MAX_AS_U32))) == as_u32(from(0)), 0);
        assert!(as_u32(sub(from(MAX_AS_U32), from(1))) == as_u32(from(MAX_AS_U32 - 1)), 0);
        assert!(as_u32(sub(neg_from(MIN_AS_U32), neg_from(1))) == as_u32(neg_from(MIN_AS_U32 - 1)), 0);
    }

    #[test]
    #[expected_failure]
    fun test_sub_overflow() {
        sub(from(MAX_AS_U32), neg_from(1));
    }

    #[test]
    #[expected_failure]
    fun test_sub_underflow() {
        sub(neg_from(MIN_AS_U32), from(1));
    }

    #[test]
    fun test_mul() {
        assert!(as_u32(mul(from(1), from(1))) == 1, 0);
        assert!(as_u32(mul(from(10), from(10))) == 100, 0);
        assert!(as_u32(mul(from(100), from(100))) == 10000, 0);
        assert!(as_u32(mul(from(10000), from(10000))) == 100000000, 0);

        assert!(as_u32(mul(neg_from(1), from(1))) == as_u32(neg_from(1)), 0);
        assert!(as_u32(mul(neg_from(10), from(10))) == as_u32(neg_from(100)), 0);
        assert!(as_u32(mul(neg_from(100), from(100))) == as_u32(neg_from(10000)), 0);
        assert!(as_u32(mul(neg_from(10000), from(10000))) == as_u32(neg_from(100000000)), 0);

        assert!(as_u32(mul(from(1), neg_from(1))) == as_u32(neg_from(1)), 0);
        assert!(as_u32(mul(from(10), neg_from(10))) == as_u32(neg_from(100)), 0);
        assert!(as_u32(mul(from(100), neg_from(100))) == as_u32(neg_from(10000)), 0);
        assert!(as_u32(mul(from(10000), neg_from(10000))) == as_u32(neg_from(100000000)), 0);
        assert!(as_u32(mul(from(MIN_AS_U32 / 2), neg_from(2))) == as_u32(neg_from(MIN_AS_U32)), 0);
    }

    #[test]
    #[expected_failure]
    fun test_mul_overflow() {
        mul(from(MIN_AS_U32 / 2), from(1));
        mul(neg_from(MIN_AS_U32 / 2), neg_from(2));
    }

    #[test]
    fun test_div() {
        assert!(as_u32(div(from(0), from(1))) == 0, 0);
        assert!(as_u32(div(from(10), from(1))) == 10, 0);
        assert!(as_u32(div(from(10), neg_from(1))) == as_u32(neg_from(10)), 0);
        assert!(as_u32(div(neg_from(10), neg_from(1))) == as_u32(from(10)), 0);

        assert!(abs_u32(neg_from(MIN_AS_U32)) == MIN_AS_U32, 0);
        assert!(as_u32(div(neg_from(MIN_AS_U32), from(1))) == MIN_AS_U32, 0);
    }

    #[test]
    #[expected_failure]
    fun test_div_overflow() {
        div(neg_from(MIN_AS_U32), neg_from(1));
    }

    #[test]
    fun test_shl() {
        assert!(as_u32(shl(from(10), 0)) == 10, 0);
        assert!(as_u32(shl(neg_from(10), 0)) == as_u32(neg_from(10)), 0);

        assert!(as_u32(shl(from(10), 1)) == 20, 0);
        assert!(as_u32(shl(neg_from(10), 1)) == as_u32(neg_from(20)), 0);

        assert!(as_u32(shl(from(10), 8)) == 2560, 0);
        assert!(as_u32(shl(neg_from(10), 8)) == as_u32(neg_from(2560)), 0);

        assert!(as_u32(shl(from(10), 31)) == 0, 0);
        assert!(as_u32(shl(neg_from(10), 31)) == 0, 0);
    }

    #[test]
    fun test_shr() {
        assert!(as_u32(shr(from(10), 0)) == 10, 0);
        assert!(as_u32(shr(neg_from(10), 0)) == as_u32(neg_from(10)), 0);

        assert!(as_u32(shr(from(10), 1)) == 5, 0);
        assert!(as_u32(shr(neg_from(10), 1)) == as_u32(neg_from(5)), 0);

        assert!(as_u32(shr(from(MAX_AS_U32), 8)) == MAX_AS_U32 >> 8, 0);
        assert!(as_u32(shr(neg_from(MIN_AS_U32), 8)) == 0xff800000, 0);
    }

    #[test]
    fun test_sign() {
        assert!(sign(neg_from(10)) == 1u8, 0);
        assert!(sign(from(10)) == 0u8, 0);
    }

    #[test]
    fun test_cmp() {
        assert!(cmp(from(1), from(0)) == GT, 0);
        assert!(cmp(from(0), from(1)) == LT, 0);

        assert!(cmp(from(0), neg_from(1)) == GT, 0);
        assert!(cmp(neg_from(0), neg_from(1)) == GT, 0);
        assert!(cmp(neg_from(1), neg_from(0)) == LT, 0);
        assert!(!lt(from(5347), neg_from(765)), 0);

        assert!(cmp(neg_from(MIN_AS_U32), from(MAX_AS_U32)) == LT, 0);
        assert!(cmp(from(MAX_AS_U32), neg_from(MIN_AS_U32)) == GT, 0);

        assert!(cmp(from(MAX_AS_U32), from(MAX_AS_U32 - 1)) == GT, 0);
        assert!(cmp(from(MAX_AS_U32 - 1), from(MAX_AS_U32)) == LT, 0);

        assert!(cmp(neg_from(MIN_AS_U32), neg_from(MIN_AS_U32 - 1)) == LT, 0);
        assert!(cmp(neg_from(MIN_AS_U32 - 1), neg_from(MIN_AS_U32)) == GT, 0);
    }

    #[test]
    fun test_castdown() {
        assert!((1u32 as u8) == 1u8, 0);
    }

    #[test]
    fun test_mod() {
        //use aptos_std::debug;
        let mut i = mod(neg_from(2), from(5));
        assert!(cmp(i, neg_from(2)) == EQ, 0);

        i = mod(neg_from(2), neg_from(5));
        assert!(cmp(i, neg_from(2)) == EQ, 0);

        i = mod(from(2), from(5));
        assert!(cmp(i, from(2)) == EQ, 0);

        i = mod(from(2), neg_from(5));
        assert!(cmp(i, from(2)) == EQ, 0);
    }
}
