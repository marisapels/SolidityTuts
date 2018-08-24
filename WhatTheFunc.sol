pragma solidity ^0.4.24;


contract WhatTheFunc {
    
    string public word;
    uint public number;
    address public owner;
    
    constructor() public  {
        word = "bird";
        number = 42;
        owner = msg.sender;
    }
    
    event Changed(address a);
    
    modifier onlyOwner {
        //paarbaudam, vai tas, kas suuta ir tas, kas 
        //parametraa owner ierakstiits ja nav met erroru
        require(msg.sender == owner);
        //izpilda taalaak funkciju, kuraa izsaukts
        _;
    }
    
    function getWord() public constant returns (string) {
        return word;
    }
    
    function setWord(string w) public onlyOwner{
        //onlyOwner isauc paarbaudes funkciju
        word = w;
        emit Changed(msg.sender);
    }  
}