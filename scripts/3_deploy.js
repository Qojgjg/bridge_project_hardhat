
const hre = require("hardhat");

async function main() {

  const BridgeEth = await hre.ethers.getContractFactory("BridgeEth");
  const bridgeEth = await BridgeEth.deploy("0xcF7db9810Ba634B038DA0c51174Ef1a7B9450bE0");

  await bridgeEth.deployed();

  console.log("BridgeEth deployed to:", bridgeEth.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
