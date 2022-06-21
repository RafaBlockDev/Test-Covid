//SPDX-License-Identifier: MIT

/// @author Rafael Fuentes Rangel
/// @title WHO smart contract
pragma solidity ^0.8.0;

import "./Clinic.sol";

contract WHO {
     
    address public ownerWHO;

    /// @dev owner of the 
    constructor() {
        ownerWHO = msg.sender;
    }

    /// @dev mapping address to bool if there are a clinic validation
    mapping(address => bool) public clinicValidation;
    /// @dev mapping clinicContract´s address to their own contract
    mapping(address => address) public clinicContractMain;
    /// @dev Array of addresses where save the clinic smart contract
    address[] public addressClinicContract;
    /// @dev Array of addresses asking for access request
    address[] requests;

    /// @dev events to emit on each function
    event RequestAccess(address);
    event NewValidClinic(address);
    event NewClinic(address, address);

    /// @dev modifier that let only the execute of WHO´s functions
    modifier OnlyWHO(address _address) {
        require(_address == ownerWHO, "Have not permission to execute the function");
        _;
    }

    /// @dev Function to access request to medical system
    function requestAccess() public {
        // Storage of requests
        requests.push(msg.sender);
        // Events emission
        emit RequestAccess(msg.sender);
    }

    /// @dev Function to show the access request
    function showRequest() public view OnlyWHO(msg.sender) returns(address[] memory) {
        // Return an array with request
        return requests;
    }

    /// @dev Function to validate new clinics can manage for itself
    function clinic(address _clinic) public OnlyWHO(msg.sender) {
        // Asign validation´s states to clinic
        clinicValidation[_clinic] = true;
        // Emission events
        emit NewValidClinic(_clinic);
    }

    /// @dev Function to validate new clinics that can manage for it self
    function factoryClinic() public {
        require(clinicValidation[msg.sender] == true, "Have not permission to execute it");
        // Generate a smart contract to generate the address
        address clinicContract = address(new Clinic(msg.sender));

        // Storage the contract address of array
        addressClinicContract.push(clinicContract);

        // Clinic and contract ship
        clinicContractMain[msg.sender] = clinicContract;

        // Events emission
        emit NewClinic(clinicContract, msg.sender);
    
    }
}