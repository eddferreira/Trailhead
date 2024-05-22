public class testeForcePageController {

    public String nomeDaConta {get; set;}
    public String numeroDaConta {get; set;}

    //Criar conta
    public void salvaConta() {
        Account conta = new Account();

        conta.Name = nomeDaConta;
        conta.AccountNumber = numeroDaConta;

        insert conta;
    }
}