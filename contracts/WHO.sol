//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract WHO {
     
    address public ownerWHO;

    /// @dev owner of the 
    constructor() {
        ownerWHO = msg.sender
    }

}