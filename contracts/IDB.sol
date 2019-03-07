pragma solidity >=0.4.22 <0.6.0;


contract IDB {
    uint private count;
    struct Pessoa {
        string nome;
        string dataNascimento;
    }

    mapping(address => Pessoa) public pessoas;

    // constructor() public{
    //     pessoas[msg.sender] = Pessoa("Maykon", "14/03/1981");
    // }

    function setPessoa(string memory _nome, string memory _dataNascimento) public{
        pessoas[msg.sender] = Pessoa(_nome, _dataNascimento);
    }

    // constructor(string memory _nome, string memory _dataNascimento) public {
    //     id = msg.sender;
    //     count++;
    //     pessoas[count] = Pessoa("Maykon Deykon", "14/03/1981");
    // }

    // function setPessoa(uint _address, string memory _nome, string memory _dataNascimento)
    // public returns (string memory nome) {
    //     pessoas[_address] = Pessoa(_nome, _dataNascimento);
    //     return pessoas[_address].nome;
    // }

    // function getPessoa(uint _address) public view returns (string memory nome, string memory dataNascimento) {
    //     return (pessoas[_address].nome, pessoas[_address].dataNascimento);
    // }
}