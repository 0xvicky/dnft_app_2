// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyToken is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    string[] IPFS_URI_1 = [
        "https://gateway.pinata.cloud/ipfs/QmVwrmmy89LQzBZ4hJboEjR8RpgPjcENwKw87bmP5WobV2",
        "https://gateway.pinata.cloud/ipfs/QmcUKSi4qqGrxfQ68zi1zjm2rgQUBopm1re7r31MWqdsar",
        "https://gateway.pinata.cloud/ipfs/QmdMi4eofMsAC6fxJf67irhN6wsxTgMAMawkysHmLhtEp1"
    ];
    string[] IPFS_URI_3 = [
        "https://gateway.pinata.cloud/ipfs/QmQ1SGH9LrHRnfPTJuPpvuUUbd1qc6yaedV382sjjNKbFX",
        "https://gateway.pinata.cloud/ipfs/QmRg6VcEryXW6vmk4YudveZpr5rfbZBg3F63KfonmeExZd",
        "https://gateway.pinata.cloud/ipfs/QmRSB9wCy2kwfK5p7mTimn8xuzLqbgyPmbmevMD8wpitRL"
    ];
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyToken", "MTK") {}

    function safeMint(address to, uint i) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, IPFS_URI_1[i]);
    }

    // The following functions are overrides required by Solidity.

    function _burn(
        uint256 tokenId
    ) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function changeUserNFT(uint _tokenId, uint uriId) public {
        string memory newURI = IPFS_URI_3[uriId];
        _setTokenURI(_tokenId, newURI);
    }
}
