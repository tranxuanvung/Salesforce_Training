public with sharing class oppController {
    @AuraEnabled()
    public static Id createOpp(Id accountId) {
        Account acc = oppDAO.getAccountById(accountId);
        Opportunity opp = new Opportunity();
        String userName = UserInfo.getName();
        
        opp.Name = 'Opportunity of ' + userName + ' for ' + acc.Name;
        opp.StageName = 'New';
        opp.CloseDate = System.today().addDays(30);
        opp.Received_Date__c = System.today();
        opp.Effective_Date__c = System.today().addDays(1);
        opp.Expiration_Date__c = System.today().addDays(1).addYears(1);
        opp.Annual_Revenue__c = acc.Annual_Revenue__c;
        opp.Cash_Flow_From_Operating_Activities__c = acc.Cash_Flow_From_Operating_Activities__c;
        opp.Current_Assets__c = acc.Current_Assets__c;
        opp.Current_Liabilities__c = acc.Current_Liabilities__c;
        opp.Long_Term_Debt__c = acc.Long_Term_Debt__c;
        opp.Net_Income__c = acc.Net_Income__c;
        opp.Shareholders_Equity__c = acc.Shareholders_Equity__c;
        opp.Total_Assets__c = acc.Total_Assets__c;
        opp.Total_Liabilities__c = acc.Total_Liabilities__c;
        opp.Total_Revenues__c = acc.Total_Revenues__c;
        opp.Retained_Earnings__c = acc.Retained_Earnings__c;
        
        try {
            insert opp;
        } catch (DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return opp.Id;
    }
}