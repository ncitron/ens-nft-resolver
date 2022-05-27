// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

import { IERC721 } from "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
import { Strings } from "openzeppelin-contracts/contracts/utils/Strings.sol";

import { IResolver } from "./interfaces/IResolver.sol";
import { Namehash } from "./Namehash.sol";

contract Resolver is IResolver {

    bytes public basename;
    IERC721 public nft;
    mapping(bytes32 => uint256) public nodes;

    constructor(bytes memory _basename, IERC721 _nft) {
        basename = _basename;
        nft = _nft;
    }

    function setup(uint256 id) external {
        bytes32 node = Namehash.namehash(bytes(Strings.toString(id)), basename, "eth");
        nodes[node] = id;
    }

    function addr(bytes32 node) external view override returns (address) {
        uint256 id = nodes[node];
        return nft.ownerOf(id);
    }

    function supportsInterface(bytes4 interfaceId) external pure override returns (bool) {
        if (interfaceId == 0x3b3b57de) return true;
        return false;
    }
}
