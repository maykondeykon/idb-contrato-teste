pragma solidity >=0.4.22 <0.6.0;


contract IDB {
    uint private count;
    struct Pessoa {
        string nome;
        string dataNascimento;
    }

    mapping(address => Pessoa) public pessoas;

    function setPessoa(string memory _nome, string memory _dataNascimento) public{
        pessoas[msg.sender] = Pessoa(_nome, _dataNascimento);
    }

    function getPessoa(address _addr) public view returns (string memory nome, string memory dataNascimento) {
        return (pessoas[_addr].nome, pessoas[_addr].dataNascimento);
    }

}