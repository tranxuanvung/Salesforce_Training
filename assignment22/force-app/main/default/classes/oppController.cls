public with sharing class oppController {
    @AuraEnabled()
    public static Id createOpp(Id accountId) {
        List<account> acc = [select id,Name,Annual_Revenue__c,Cash_Flow_From_Operating_Activities__c,Current_Assets__c,Current_Liabilities__c,Long_Term_Debt__c,Net_Income__c,Retained_Earnings__c,Shareholders_Equity__c,Total_Assets__c,Total_Liabilities__c,Total_Revenues__c From account where Id = :accountId];
        
        Opportunity opp = new Opportunity();
        String userName = UserInfo.getName();
        
        if(acc[0].Id == accountId){
            opp.Name = 'Opportunity of ' + userName + ' for ' + acc[0].Name;
            opp.StageName = 'New';
            opp.CloseDate = System.today().addDays(30);
            opp.Received_Date__c = System.today();
            opp.Effective_Date__c = System.today().addDays(1);
            opp.Expiration_Date__c = System.today().addDays(1).addYears(1);
            opp.Annual_Revenue__c = acc[0].Annual_Revenue__c;
            opp.Cash_Flow_From_Operating_Activities__c = acc[0].Cash_Flow_From_Operating_Activities__c;
            opp.Current_Assets__c = acc[0].Current_Assets__c;
            opp.Current_Liabilities__c = acc[0].Current_Liabilities__c;
            opp.Long_Term_Debt__c = acc[0].Long_Term_Debt__c;
            opp.Net_Income__c = acc[0].Net_Income__c;
            opp.Shareholders_Equity__c = acc[0].Shareholders_Equity__c;
            opp.Total_Assets__c = acc[0].Total_Assets__c;
            opp.Total_Liabilities__c = acc[0].Total_Liabilities__c;
            opp.Total_Revenues__c = acc[0].Total_Revenues__c;
            opp.Retained_Earnings__c = acc[0].Retained_Earnings__c;
            try {
                insert opp;
            } catch (DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }

        return opp.Id;
    }
}