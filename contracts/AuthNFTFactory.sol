// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./AuthNFT.sol";

contract AuthNFTFactory is Ownable {
    event NewAuthNFT(address _owner, address _nft);

    function createAuthNFT(string calldata _name, string calldata _uri) public {
        address _nft = address(new AuthNFT(_name, _uri));
        AuthNFT(_nft).transferOwnership(msg.sender);
        emit NewAuthNFT(msg.sender, _nft);
    }
}
