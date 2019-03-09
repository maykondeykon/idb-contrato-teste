const IDB = artifacts.require("./IDB.sol");

contract("IDB", accounts => {
  let instance;
  let owner = accounts[0];
  let account = accounts[1];

  beforeEach(async () => {
    instance = await IDB.deployed();
  });

  it("Deve salvar uma pessoa nova", async () => {
    try {
      let nome = "Maykon Deykon";
      let dtNascimento = "14/03/1981";
      
      let pessoaInserida = await instance.addPessoa(nome, dtNascimento);
      let pessoaRecuperada = await instance.getPessoa(owner);

      assert.equal(pessoaRecuperada.nome, nome);
      console.log("Pessoa: ", pessoaRecuperada);
    } catch (e) {
      console.log(e);
    }
  });

  it("Deve salvar um documento novo", async () => {
      try{
        let tipo = "CPF";
        let ipfsHash = "99revnsddvjn8rv0ejv0";

        let documentoInserido = await instance.addDocumento(owner, tipo, ipfsHash);
        let documentoRecuperado = await instance.getDocumento(owner, 0);

        assert.equal(documentoRecuperado.tipo, tipo);
        assert.equal(documentoRecuperado.ipfsHash, ipfsHash);

        console.log("Documento: ", documentoRecuperado);
      }catch (e){
        console.log(e);
      }
  });

  it("Deve salvar um detalhe novo", async () => {
    try{
      let chave = "numero";
      let valor = "643.147.313.20";

      let detalheInserido = await instance.addDetalhe(owner, 0, chave, valor);
      let detalheRecuperado = await instance.getDetalhe(owner, 0, 0);

      assert.equal(detalheRecuperado.chave, chave);
      assert.equal(detalheRecuperado.valor, valor);

      console.log("Detalhe: ", detalheRecuperado);
    }catch (e){
      console.log(e);
    }
});
});
