import express, { Router } from "express";
import {JsonRpcProvider, Wallet, Contract, formatEther, parseEther} from "ethers";
import { BlogTokenAbi } from "../BlogToken.abi.ts";

const router = express.Router();

const provider = new JsonRpcProvider(process.env.RPC_URL);
const wallet = new Wallet(process.env.PRIVATE_KEY!, provider);
const contract = new Contract(process.env.CONTRACT_ADDRESS!, BlogTokenAbi, wallet);

// Get token balance
router.get("/balance/:address", async (req, res) => {
    try {
        const balance = await contract.balanceOf!(req.params.address);
        res.json({ balance: formatEther(balance) });
    } catch (error) {
        res.status(500).json({ error: (error as Error).message });
    }
});

// Transfer tokens
router.post("/transfer", async (req, res) => {
    const {to, amount} = req.body;
    
    try {
        const tx = await contract.transfer!(to, parseEther(amount));
        await tx.wait();
        res.json({transactionHash: tx.hash});
    } catch (error) {
        res.status(500).json({
            error: (error as Error).message
        })
    }
})

export default router;
