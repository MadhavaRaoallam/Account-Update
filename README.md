This Package contains a batch class which updates the account records.
use the below syntax to run the Batch class
updateAccountStatus accountBatch = new updateAccountStatus('customer');
Database.executeBatch(accountBatch); 
'customer' is a record type name
Please specify the record type name in the constructor parameter and only those records will be processed.
if the 'Enterprise Account status' is null then 'Bronze' value will be updated
If 'Gold Account' is true for any record then the corresponding 'Enterprise Account status' field will be updated to 'Gold'
