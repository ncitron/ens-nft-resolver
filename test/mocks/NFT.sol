// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.14;

import { ERC721 } from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function mint(address to, uint256 id) external  {
        _mint(to, id);
    }
}
