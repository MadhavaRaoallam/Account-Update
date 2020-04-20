@isTest

Public class updateAccountStatusTest {
    
    @testSetup static void setup() {
        list<account> accList = new list<account>();
        Account accSO = new account();
        accSO.name = 'test account';
        accSO.Enterprise_Account_Status__c = null;
        accList.add(accSO);
        Account accSO1 = new account();
        accSO1.name = 'test account';
        accSO1.Enterprise_Account_Status__c = 'Bronze';
        accSO1.Gold_Account__c=true;
        accList.add(accSO1);
        insert accList;
    }
    @isTest static void accountBatch() {
        list<Account> accList = [SELECT Id,Enterprise_Account_Status__c,Gold_Account__c FROM Account];
        System.AssertEquals(accList.size(),2);
        updateAccountStatus accountBatch = new updateAccountStatus('customer');
        Database.executeBatch(accountBatch);
    }   
}