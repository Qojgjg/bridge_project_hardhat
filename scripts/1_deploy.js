
const hre = require("hardhat");

async function main() {

  const TestTokenEth = await hre.ethers.getContractFactory("TestTokenEth");
  const testTokenEth = await TestTokenEth.deploy();

  await testTokenEth.deployed();

  console.log("TestTokenEth deployed to:", testTokenEth.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
