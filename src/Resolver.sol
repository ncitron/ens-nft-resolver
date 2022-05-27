// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

import { IResolver } from "./interfaces/IResolver.sol";

contract Resolver is IResolver {

    function supportsInterface(bytes4 interfaceId) external view override returns (bool) {
        if (interfaceId == 0x3b3b57de) return true;
        return false;
    }

    function addr(bytes32 node) external view override returns (address) {
        return address(this);
    }
}
