import {React,useState} from 'react';
import {ethers} from 'ethers';
import {contractAddress, abi} from '../common.js';
// import useState from 'react';
function ChangeNFT(){
    const [tokenID,setTokenID] = useState("");
    const [URI,setURI] = useState("");
 const changeNFT = async()=>{
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const contract = new ethers.Contract(contractAddress,abi, signer);

    try {
        const changeData = await contract.changeUserNFT(tokenID, URI);
        await changeData.wait();
        console.log(changeData);
    } catch (error) {
        console.log("Error occured")
    }
    console.log(`NFT has been changed${tokenID}`);



 }



    return(
    <>
        
       <input type="text"  value = {tokenID} onChange={(e)=>setTokenID(e.target.value)} placeholder= "TOKEN ID"></input>
       <input type="text"  value = {URI} onChange={(e)=>setURI(e.target.value)} placeholder= "URI NO"></input>
        <button type="button" class="btn btn-primary" onClick={changeNFT}>Change NFT</button>
       {/* <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"></input>     */}
        </>
    )
}

export default ChangeNFT;