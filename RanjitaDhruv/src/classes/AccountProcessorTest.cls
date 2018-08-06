@isTest
public class AccountProcessorTest{

    Public static testmethod void Accountprotest(){
        List<contact> conlist =  new List<contact>();
        Account acc = new Account(Name = 'testaccount');
        insert acc;
        for(Integer i = 0;i < 200; i++){
         Contact c = new Contact();
         c.FirstName = 'Trail' + i;
         c.LastName = 'lastName' + i;
         c.AccountId = acc.Id;   
         conlist.add(c);
        }
          insert conlist;          
        Set<Id> setaccid = new Set<Id>();
        setaccid.add(acc.id);
        Test.startTest();
        AccountProcessor.countContacts(setaccid);
        Test.stopTest();
        Account acclist = [Select Number_of_Contacts_c__c from Account where Id =: acc.id LIMIT 1];
        System.assertEquals(integer.valueOf(acclist.Number_of_Contacts_c__c),200);
     }

}