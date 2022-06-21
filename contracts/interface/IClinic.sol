pragma solidity ^0.8.0;

interface IClinic {
    function emitResults(string memory _idPatient, string memory _codeHash, bool _resultPatient) external view;

    function showResults(string memory _idPatient) external view returns (string memory, string memory);
}
