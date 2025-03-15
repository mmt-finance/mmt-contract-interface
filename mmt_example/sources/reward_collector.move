module mmt_example::reward_collector{
    use mmt_v3::position::{Self, Position};
    use mmt_v3::pool::{Pool};
    use mmt_v3::version::{Version};
    use mmt_v3::collect::{Self};
    use sui::clock::{Clock};
    use sui::transfer::public_transfer;

    public fun collectFees<X, Y> (
        pool: &mut Pool<X, Y>,
        position: &mut Position,
        clock: &Clock,
        version: &Version,
        recipient: address,
        tx_context: &mut TxContext,
    ) {
        let (coinX, coinY) = collect::fee(pool, position, clock, version, tx_context);
        public_transfer(coinX, recipient);
        public_transfer(coinY, recipient);
    }

    /*
     * If multiple rewards are present, the `reward` function should be invoked multiple times
     * to ensure each reward is properly collected.
    */
    public fun collectReward<X, Y, R> (
        pool: &mut Pool<X, Y>,
        position: &mut Position,
        clock: &Clock,
        version: &Version,
        recipient: address,
        tx_context: &mut TxContext,
    ) {
        let reward = collect::reward<X, Y, R>(pool, position, clock, version, tx_context);
        public_transfer(reward, recipient);
    }
}