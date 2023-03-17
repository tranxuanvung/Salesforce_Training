public with sharing class oppDAO {
    public static Account getAccountById(Id accountId){
        Account account = [select id,Name,Annual_Revenue__c,Cash_Flow_From_Operating_Activities__c,Current_Assets__c,Current_Liabilities__c,Long_Term_Debt__c,Net_Income__c,Retained_Earnings__c,Shareholders_Equity__c,Total_Assets__c,Total_Liabilities__c,Total_Revenues__c From Account where Id = :accountId];
        return account;
    }
}