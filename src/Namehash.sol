// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

library Namehash {
    function namehash(bytes memory subdomain, bytes memory domain, bytes memory tld) external pure returns (bytes32) {
        bytes32 node = bytes32(0);
        node = keccak256(abi.encodePacked(node, tld));
        node = keccak256(abi.encodePacked(node, domain));
        node = keccak256(abi.encodePacked(node, subdomain));

        return node;
    }
}
