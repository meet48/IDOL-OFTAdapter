
# Build

## Compiling your contracts

This project supports both `hardhat` and `forge` compilation. By default, the `compile` command will execute both:

```bash
$ pnpm compile
```

If you prefer one over the other, you can use the tooling-specific commands:

```bash
$ pnpm compile:forge
$ pnpm compile:hardhat
```

## Running Tests

Similar to the contract compilation, we support both `hardhat` and `forge` tests. By default, the `test` command will execute both:

```bash
$ pnpm test
```

If you prefer one over the other, you can use the tooling-specific commands:

```bash
$ pnpm test:forge
$ pnpm test:hardhat
```


# Deploy

## Deploy IDOL Adapter on BSC

In the `hardhat.config.ts` file, add the inner token's address to the network you want to deploy the OFTAdapter to:

```typescript
// Replace `0x0` with the address of the ERC20 token you want to adapt to the OFT functionality.
oftAdapter: {
    tokenAddress: '<INNER_TOKEN_ADDRESS>',
}
```

Deploy MeetAdapter to bsc

```bash
$ rm -rf ./deployments/ 

$ pnpm hardhat lz:deploy --tags MeetAdapter --networks bsc
```

## Deploy Meet on Ethereum

```bash
$ pnpm hardhat lz:deploy --tags Meet --networks ethereum
```

# Verify

You can verify EVM chain contracts using the LayerZero helper package:

```bash
$ pnpm dlx @layerzerolabs/verify-contract -n <NETWORK_NAME> -u <API_URL> -k <API_KEY> --contracts <CONTRACT_NAME>
```

```bash
# chain ids: https://docs.etherscan.io/supported-chains

# bsc
$ pnpm dlx @layerzerolabs/verify-contract -n bsc -u "https://api.etherscan.io/v2/api?chainid=56" -k <API Key> --contracts MeetAdapter

# ethereum
$ pnpm dlx @layerzerolabs/verify-contract -n ethereum -u "https://api.etherscan.io/v2/api?chainid=1" -k <API Key> --contracts Meet
```


# Wire Everything to Enable Messaging 

The OFT standard builds on top of the OApp standard, which enables generic message-passing between chains. After deploying the OFT on the respective chains, you enable messaging by running the [wiring](https://docs.layerzero.network/v2/concepts/glossary#wire--wiring) task.

Run the wiring task:

```bash
$ pnpm hardhat lz:oapp:wire --oapp-config layerzero.config.ts
```

Submit all the transactions to complete wiring. After all transactions confirm, your OApps are wired and can send messages to each other.

# Send Tokens

```bash
# Send 1 $IDOL from **BSC** to **Ethereum**
$ pnpm hardhat lz:oft:send --src-eid 30102 --dst-eid 30101 --amount 1 --to xx

# Send 1 $IDOL from **Ethereum** to **BSC**
$ pnpm hardhat lz:oft:send --src-eid 30101 --dst-eid 30102 --amount 1 --to xx
```