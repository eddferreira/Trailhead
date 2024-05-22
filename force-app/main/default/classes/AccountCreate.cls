public with sharing class AccountCreate {

    @AuraEnabled
    public static void gravaConta(String nome) {
        Account conta = new Account();

        conta.Name = nome;

        insert conta;
    }
}