pragma solidity >=0.4.22 <0.6.0;


contract IDB {
    struct Pessoa {
        string nome;
        string dataNascimento;
        uint numDocumentos;
        mapping(uint => Documento) documentos;
    }

    struct Documento{
        string tipo;
        string ipfsHash;
        uint numDetalhes;
        bool excluido;
        mapping(uint => Detalhe) detalhes;
    }

    struct Detalhe{
        string chave;
        string valor;
        bool excluido;
    }

    mapping(address => Pessoa) public pessoas;

    function addPessoa(string memory _nome, string memory _dataNascimento) public{
        pessoas[msg.sender] = Pessoa({nome: _nome, dataNascimento: _dataNascimento, numDocumentos: 0});
    }

    function getPessoa(address _addr) public view returns (string memory nome, string memory dataNascimento) {
        return (pessoas[_addr].nome, pessoas[_addr].dataNascimento);
    }
    
    function addDocumento(address _addr, string memory _tipo, string memory _ipfsHash) public {
        Pessoa storage p = pessoas[_addr];
        p.documentos[p.numDocumentos++] = Documento({tipo: _tipo, ipfsHash: _ipfsHash, numDetalhes: 0, excluido: false});
    }

    function getDocumento(address _addr, uint _numDocumento) public view returns(string memory tipo, string memory ipfsHash, uint numDetalhes, bool excluido) {
        Pessoa storage p = pessoas[_addr];
        Documento storage d = p.documentos[_numDocumento];
        return (d.tipo, d.ipfsHash, d.numDetalhes, d.excluido);
    }

    function excluiDocumento(address _addr, uint _numDocumento) public returns (bool retorno) {
        Pessoa storage p = pessoas[_addr];
        Documento storage d = p.documentos[_numDocumento];
        d.excluido = true;
        return (d.excluido);
    }

    function addDetalhe(address _addr, uint _numDocumento, string memory _chave, string memory _valor) public {
        Pessoa storage p = pessoas[_addr];
        Documento storage d = p.documentos[_numDocumento];
        d.detalhes[d.numDetalhes++] = Detalhe({chave: _chave, valor: _valor, excluido: false});
    }

    function getDetalhe(address _addr, uint _numDocumento, uint _numDetalhe) public view returns(string memory chave, string memory valor, bool excluido) {
        Pessoa storage p = pessoas[_addr];
        Documento storage d = p.documentos[_numDocumento];
        Detalhe storage dt = d.detalhes[_numDetalhe];

        return (dt.chave, dt.valor, dt.excluido);
    }
}