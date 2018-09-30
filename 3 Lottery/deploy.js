const HDWalletProvider = require('truffle-hdwallet-provider');

const Web3 = require('web3');
const { interface, bytecode} = require('./compile');

const ganache = require('ganache-cli');
// const provider = ganache.provider();

const provider = new HDWalletProvider(
    'add range chicken sniff wrestle acquire sadness lake follow quote picture output',
    'https://rinkeby.infura.io/v3/67b600d8f1b947e38d30fdf4dda8e914'
);

const web3 = new Web3(provider);

const deploy = async() =>{

    const accounts = await web3.eth.getAccounts();

    console.log('Deploying contract from account',accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data : '0x' + bytecode})
    .send({gas:'600000',from:accounts[0]});

    console.log("Interface: "+interface);

    console.log('Contract deployed to',result.options.address);
};

deploy();