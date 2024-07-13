# Medi Buddy Token

This project builds a Medi Buddy Token based on ERC-20 standards. Medi Buddy was the name for my research paper that aims to share my vision of using UAV Technology in countering the increasing road accident fatalities. And as this project also makes use of blockchain technology for storing of the data and making it tamperament proof, hence I wanted to provide it some value in form of fungible tokens.

## Contributions

Contributions are highly appreciated.

For contributing to this repo start by forking and then cloning it.

```shell
git clone https://github.com/Ayush-Thakur-geek/Medi-Buddy-Token.git
```

After the cloning is done, we need to provide hardhat environment for the project to properly function.

Note: For below comands to work we need node installed in your systems.

```shell
yarn init
```

or

```shell
npm init
```

Now install hardhat.

```shell
yarn add --dev hardhat
```

or

```shell
npm install --save-dev hardhat
```

Congrats! you have all necessary condition for this project and for further info go to official hardhat docs: https://hardhat.org/docs

## Smart Contract

### Contract Details

- **Name:** Medi Buddy Token
- **Symbol:** MBT
- **Decimals:** 0
- **Total Supply:** Variable (set upon deployment and can be increased by the owner)

### Functions

- `balanceOf(address _owner) public view returns (uint256)`
- `allowance(address _owner, address _spender) public view returns (uint256)`
- `approve(address _spender, uint256 _value) public returns (bool)`
- `transfer(address _to, uint256 _value) public returns (bool)`
- `transferFrom(address _from, address _to, uint256 _value) public returns (bool)`
- `mint(address _to, uint256 _value) public onlyOwner`
- `burn(uint256 _value) public`

