pragma solidity ^0.8.0;

interface IWHO {

    function requestAccess() external view;

    function showRequest() external view returns(address[] memory);

    function clinic(address _clinic) external view;

    function factoryClinic() external view;
}