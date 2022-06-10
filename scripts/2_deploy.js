
const hre = require("hardhat");

async function main() {

  const TestTokenBsc = await hre.ethers.getContractFactory("TestTokenBsc");
  const testTokenBsc = await TestTokenBsc.deploy();

  await testTokenBsc.deployed();

  console.log("TestTokenBsc deployed to:", testTokenBsc.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
