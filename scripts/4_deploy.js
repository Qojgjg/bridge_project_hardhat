
const hre = require("hardhat");

async function main() {

  const BridgeBsc = await hre.ethers.getContractFactory("BridgeBsc");
  const bridgeBsc = await BridgeBsc.deploy();

  await bridgeBsc.deployed();

  console.log("BridgeBsc deployed to:", bridgeBsc.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
