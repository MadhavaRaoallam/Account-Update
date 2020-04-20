global class updateAccountStatus implements Database.Batchable<sObject>{ 

    string recordTypeName;
    static final string BRONZE = 'Bronze';
    static final string GOLD = 'Gold';

    public updateAccountStatus(string recordTypeName) {
        this.recordTypeName = recordTypeName;
    }
    

    global Database.QueryLocator start(Database.BatchableContext BC){
        string query = 'SELECT Id,Enterprise_Account_Status__c,Gold_Account__c FROM Account '+
                        'WHERE recordType.Name = \''+recordTypeName+'\'';
        system.debug('query = '+query);
        return Database.getQueryLocator(query);
   }
    
    global void execute(Database.BatchableContext info, List<Account> scope) {
        List<Account> accsToUpdate = new List<Account>();
        for(Account objVar : scope){ 
            if(String.isBlank(objVar.Enterprise_Account_Status__c)) {
                objVar.Enterprise_Account_Status__c = BRONZE;
                accsToUpdate.add(objVar);
            }
            else if(objVar.Gold_Account__c) {
                objVar.Enterprise_Account_Status__c = GOLD;
                accsToUpdate.add(objVar);
            }
        }
        update accsToUpdate; 
    }    
    
    global void finish(Database.BatchableContext info){     
    
    } 
}