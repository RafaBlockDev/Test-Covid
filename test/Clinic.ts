import { expect } from "chai";
import { ethers } from "hardhat";

describe("Clinic", function () {
  it("Should return the contract deployed", async function () {
    console.log("📝 Compiling smart contract... ")
    const Clinic = await ethers.getContractFactory("Clinic");
    console.log("🚀 Deploying smart contract... ")
    const clinic = await Clinic.deploy("Clinic contract deployed");
    await clinic.deployed();
  });
});
