//SPDX-License-Identifier: MIT

/// @author Rafael Fuentes Rangel
/// @title Clinic

pragma solidity ^0.8.0;

contract Clinic {

    address public addressClinic;

    /// @param _addCli is the address.
    constructor(address _addCli) {
        addressClinic = _addCli;
    }

    /// @dev Structure of the results.
    struct Results {
        bool diagnosis;
        string codeHash;
    }

    /// @dev Event that notify when has created a new result.
    event newResult (bool, string);

    /// @dev Mapping the result and the own-self hash per each person.
    mapping(bytes32 => Results) covidResults;

    /// @dev Modifier to force to be the address "_addClinic" to execute the function.
    modifier validateClinic(address _addClinic) {
        require(_addClinic == addressClinic, "You have not permission to execute this function");
        _;
    }

    /// @dev Function to wmit the results of the COVID test.
    function emitResults() public {}

    /// @dev Function to show the results.
    function showResults() public {}

}