@RestResource(urlMapping = '/Accounts/*/contacts')
global with sharing class AccountManager {
	
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result = [select Id, Name, (select Id, Name from Contacts) from Account where Id=:accountId Limit 1];
        return result;
    }
}