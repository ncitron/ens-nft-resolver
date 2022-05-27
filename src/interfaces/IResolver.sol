// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

interface IResolver {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
    function addr(bytes32 node) external view returns (address);
}
