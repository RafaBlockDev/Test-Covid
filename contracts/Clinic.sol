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
    event newResult(bool, string);

    /// @dev Mapping the hash with the patient.
    mapping(bytes32 => Results) resultPatient;

    /// @dev Modifier to force to be the address "_addClinic" to execute the function.
    modifier validateClinic(address _addClinic) {
        require(
            _addClinic == addressClinic,
            "You have not permission to execute this function"
        );
        _;
    }

    /// @dev Function to emit the results of the COVID test.
    function emitResults(
        string memory _idPatient,
        string memory _codeHash,
        bool _resultPatient
    ) public validateClinic(msg.sender) {
        bytes32 hashIdPatient = keccak256(abi.encodePacked(_idPatient));

        resultPatient[hashIdPatient] = Results(_resultPatient, _codeHash);
    }

    /// @dev Function to show the results which returns the results.
    function showResults(string memory _idPatient)
        public
        view
        returns (string memory, string memory)
    {
        string memory resultTest;

        bytes32 hashIdPatient = keccak256(abi.encodePacked(_idPatient));

        if (resultPatient[hashIdPatient].diagnosis == true) {
            resultTest = "Positivo";
        } else {
            resultTest = "Negativo";
        }

        return (resultTest, resultPatient[hashIdPatient].codeHash);
    }
}
