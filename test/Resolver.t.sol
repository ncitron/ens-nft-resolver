// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

import "forge-std/Test.sol";

import { Resolver } from "../src/Resolver.sol";

contract ResolverTest is Test {

    Resolver public resolver;

    function setUp() public {
        resolver = new Resolver();
    }

    function testSupportsInterfaceTrue() public {
        bool support = resolver.supportsInterface(0x3b3b57de);
        assertTrue(support);
    }

    function testSupportsInterfaceFalse() public {
        bool support = resolver.supportsInterface(0x12345678);
        assertFalse(support);
    }

    function testAddr() public {
        address resolved = resolver.addr(keccak256("test"));
        assertEq(resolved, address(resolver));
    }
}
