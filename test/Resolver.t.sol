// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

import "forge-std/Test.sol";
import { Strings } from "openzeppelin-contracts/contracts/utils/Strings.sol";

import { Namehash } from "../src/Namehash.sol";
import { NFT } from "../test/mocks/NFT.sol";
import { Resolver } from "../src/Resolver.sol";

contract ResolverTest is Test {

    Resolver public resolver;
    bytes public basename;
    NFT public nft;

    function setUp() public {
        nft = new NFT("Not Fungible Token", "NFT");
        basename = "mynftens.eth";
        resolver = new Resolver(basename, nft);
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
        uint256 id = 7;
        address guy = address(0x1234);
        nft.mint(guy, id);
        resolver.setup(id);

        bytes32 node = Namehash.namehash(bytes(Strings.toString(id)), basename, "eth");
        address resolved = resolver.addr(node);
        assertEq(resolved, guy);
    }
}
