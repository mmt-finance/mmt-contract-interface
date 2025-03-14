module mmt_example::reward_collector{
    use mmt_v3::position::{Self, Position};
    use mmt_v3::pool::{Pool};
    use mmt_v3::version::{Version};
    use mmt_v3::collect::{Self};
    use sui::clock::{Clock};
    use sui::transfer::public_transfer;

    public fun collectFeesAndReward<X, Y> (
        pool: &mut Pool<X, Y>,
        position: &mut Position,
        clock: &Clock,
        version: &Version,
        tx_context: &mut TxContext,
    ) {
        let (coinX, coinY) = collect::fee(pool, position, clock, version, tx_context);
        public_transfer(coinX, tx_context::sender(tx_context));
        public_transfer(coinY, tx_context::sender(tx_context));
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
        tx_context: &mut TxContext,
    ) {
        let reward = collect::reward<X, Y, R>(pool, position, clock, version, tx_context);
        public_transfer(reward, tx_context::sender(tx_context));
    }

    public fun hasClaimableFee(position: & Position) : bool {
        position::owed_coin_x(position) > 0 && position::owed_coin_y(position) > 0
    }

    public fun hasClaimableReward(position: & Position) : bool{
        let reward_length = position::reward_length(position);
        if (reward_length == 0) {
            return false
        };
        let mut i = 0;
        while (i < reward_length){
            let claimable_reward = position::coins_owed_reward(position, i);
            if (claimable_reward > 0) {
                return true
            };
            i = i + 1;
        };
        return false
    }
}