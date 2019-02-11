pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/drafts/TokenVesting.sol";

/*
// Replace the values below with desired values.
//
// This is how it works:
// - define the values. The multi-sig address is the address which should receive the tokens
// - START value MUST be in the future
// - once the CLIFF expires, the tokens will begin vesting. Put the cliff to 0 if you want them
//   to begin vesting immediately, and to be 100% withdrawable after DURATION
// - during vesting, the tokens will not be withdrawable every 1 month, but linearly as time 
//   expires, the proportionate amount will become withdrawable until 100% is reached after DURATION
// - the underlying contract used for the root logic is from OpenZeppelin and has been heavily
//   audited. It can be considered 100% safe to use, even in light of the coming difficulty bomb 
//   and pending release and development of Ethereum 2.0
*/
contract LDVesting is TokenVesting {
    constructor () TokenVesting(
        0xb250B4a88E7B1e5A2B32e68035e2792190808A5c, // enter multi-sig address here
        1549483561, // START: enter unix timestamp of date when vesting should begin. Use epochconverter.com to calculate it.
        0, // CLIFF: in seconds. From "START" (above) until START + this many seconds, no tokens will be vested (cliff period)
        30758400, // DURATION: one year in seconds
        false // REVOKABLE: whether or not the "owner" (the one who deploys the contract) should be able to cancel the vesting and grab all tokens
    ) public { }
}