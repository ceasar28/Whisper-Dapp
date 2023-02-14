const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();
  console.log("Contract deployed to:", waveContract.address);
  console.log("Contract deployed by: ", owner.address);

  await waveContract.getTotalWaves();

  // wave done by my account
  const wave1Txn = await waveContract.wave();
  await wave1Txn.wait();

  await waveContract.getTotalWaves();

  // wave done by another account
  const wave2Txn = await waveContract.connect(randomPerson).wave();
  await wave2Txn.wait();

  await waveContract.getTotalWaves();
};

const runMain = async () => {
  try {
    await main();
    process.exit(0); // exit Node process without error
  } catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught fatal Exception' error
  }
};

runMain();

/**
 * In order to deploy something to the blockchain, we need to have a wallet address! Hardhat does this for us magically in the background, but here I grabbed the wallet address of contract owner and I also grabbed a random wallet address and called it randomPerson. This will make more sense in a moment.
 *
 *
 */
