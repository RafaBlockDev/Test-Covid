import { ethers } from "hardhat";

describe("WHO", function () {
  it("Should return the contract deployed", async function () {
    console.log("📝 Compiling smart contract... ")
    const WHO = await ethers.getContractFactory("WHO");
    console.log("🚀 Deploying smart contract... ")
    const who = await WHO.deploy();
    await who.deployed();
  });
});
