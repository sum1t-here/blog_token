# BlogToken API

A simple Express + TypeScript backend to interact with the **BlogToken (ERC20)** smart contract.
Allows checking token balances and transferring tokens via API endpoints.

---

## Features

* **Check balance** of any address
* **Transfer tokens** between addresses
* Built with **Express**, **TypeScript**, and **ethers.js v6**
* Compatible with local Ethereum nodes (Anvil) or testnets

---

## Prerequisites

* Node.js / Bun
* TypeScript
* Ethereum node (Anvil, Ganache, or testnet)
* Deployed BlogToken contract

---

## Installation

1. Clone the repo:

```bash
git clone https://github.com/sum1t-here/blog_token.git
cd backend
```

2. Install dependencies (Bun example):

```bash
bun install
```

3. Create a `.env` file in the root:

```
PORT=3000
RPC_URL=http://127.0.0.1:8545
PRIVATE_KEY=0x<your-private-key>
CONTRACT_ADDRESS=0x<deployed-contract-address>
```

4. Compile contracts (if using Foundry):

```bash
cd contracts
forge build
```

---

## Running the Server

```bash
bun run start
```

Server will be available at `http://localhost:3000`.

---

## API Routes

### 1. Check Token Balance

**GET** `/api/balance/:address`

**Params:**

| Parameter | Description               |
| --------- | ------------------------- |
| `address` | Ethereum address to query |

**Response:**

```json
{
  "balance": "1000.0"
}
```

---

### 2. Transfer Tokens

**POST** `/api/transfer`

**Body:**

```json
{
  "to": "0xRecipientAddress",
  "amount": "10.5"
}
```

* `amount` is in **Ether units**, e.g., 10.5 tokens.

**Response:**

```json
{
  "txHash": "0xTransactionHash"
}
```

---

## Notes

* Make sure your **RPC\_URL** points to a running Ethereum node (Anvil or testnet).
* **PRIVATE\_KEY** must have sufficient tokens to perform transfers.
* This API is for **development/testing** purposes only. Do not expose private keys in production.

---

## Example Postman Requests

* **Check Balance:** `GET http://localhost:3000/api/balance/0xYourAddress`
* **Transfer Tokens:** `POST http://localhost:3000/api/transfer` with JSON body

---