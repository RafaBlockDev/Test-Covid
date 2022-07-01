import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { ethers } from "hardhat";

let user:SignerWithAddress;
let user2:SignerWithAddress;

describe("Clinic", function () {
  it("Should return the contract deployed", async function () {
    const WHO = await ethers.getContractFactory("WHO");
    const who = await WHO.deploy();
    await who.deployed();

    console.log("📝 Compiling smart contract... ")
    const Clinic = await ethers.getContractFactory("Clinic");
    console.log("🚀 Deploying smart contract... ")
    const clinic = await Clinic.deploy(who.address);
    await clinic.deployed();
  });
});
