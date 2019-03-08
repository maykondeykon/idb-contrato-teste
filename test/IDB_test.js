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
});
