const { ethers, run, network } = require("hardhat");

async function main() {
  const tokenFactory = await ethers.getContractFactory("MyToken");
  console.log("Deploying MyToken...");
  let initialSupply = 1000;
  const token = await tokenFactory.deploy(initialSupply);

  await token.waitForDeployment();
  console.log(`Contract deployed to ${token.target}`);

  console.log(`Current network chain ID: ${network.config.chainId}`);
  if (network.config.chainId === 11155111) {
    console.log("Waiting for block confirmations...");
    await token.deploymentTransaction().wait(5);
    await verify(token.target, [initialSupply]);
  }
}

async function verify(contractAddress, args) {
  console.log("Verifying Contract...");
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    });
  } catch (error) {
    if (error.message.toLowerCase().includes("already verified")) {
      console.log("Contract already verified");
    } else {
      console.log("Error verifying contract:", error);
    }
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("An error occurred during deployment:", error);
    process.exit(1);
  });
