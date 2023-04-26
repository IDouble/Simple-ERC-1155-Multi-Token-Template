// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PlanetEarth is ERC1155, Ownable {

    uint256 public constant EARTH = 0; // Unique Token, Non-fungible Token (NFT), planet Earth only exists once
    uint256 public constant GOLD = 1; // Cryptocurrency, There're about 250'000 tonnes of gold on planet Earth
    uint256 public constant SILVER = 2; // Cryptocurrency, There're about 2'000'000 tonnes of silver on planet Earth

    constructor() ERC1155("https://planet.example/api/item/{id}.json") { // The link to access our Token trough it's ID
        _mint(msg.sender, EARTH, 1, ""); // Unique Token, Non-fungible Token (NFT), we only create 1 planet Earth
        _mint(msg.sender, GOLD, 250000, ""); // Cryptocurrency, There're about 250'000 tonnes of gold on planet Earth
        _mint(msg.sender, SILVER, 2000000, ""); // Cryptocurrency, There're about 2'000'000 tonnes of silver on planet Earth
    } // msg.sender = our ethereum address, EARTH = the constant we specified above, 1 = Amount (how many are created)

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner // Only the smart contract owner can execute this function
    { // This is our mint function to create new tokens and assign them to an ethereum address
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner // Only the smart contract owner can execute this function
    { // The _mintBatch() function enables the Owner to create multiple tokens in a batch with one transaction
        _mintBatch(to, ids, amounts, data);
    } 

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }
}