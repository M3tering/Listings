// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

error FeeError();
error IndexError();
error CannotBeZero();
error PaymentError();
error RevenueError();
error UnauthorizedError();

interface IListings {
    struct Listing {
        uint256 tokenId;
        uint256 price;
        address owner;
    }

    event Claim(
        address indexed to,
        uint256 indexed amount,
        uint256 indexed timestamp
    );

    event CreatedListing(
        address indexed owner,
        uint256 indexed tokenId,
        uint256 indexed price
    );

    event RemovedListing(address indexed owner, uint256 indexed tokenId);

    event PurchasedListing(
        address indexed buyer,
        uint256 indexed tokenId,
        uint256 indexed price
    );

    function setNftContract(address registry) external;

    function createListing(uint256 tokenId, uint256 price) external;

    function updateListingPrice(uint256 index, uint256 price) external;

    function removeListing(uint256 index) external;

    function purchaseListing(uint256 index) external payable;

    function withdrawRevenue() external;

    function revenueOf(address owner) external view returns (uint256);

    function getAllListing() external view returns (Listing[] memory);

    function getListingByIndex(
        uint256 index
    ) external view returns (Listing memory);

    function totalListings() external view returns (uint256);
}