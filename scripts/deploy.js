const {ethers}= require("hardhat");

async function main() {
 const contractFactory = await new ethers.getContractFactory('MyToken');
 const contractDeploy = await contractFactory.deploy();
 await contractDeploy.deployed();
const contractAddress = contractDeploy.address;
console.log(contractAddress);

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
