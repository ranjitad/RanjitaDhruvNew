@isTest
public class TestRestrictContactByName {
    
    Public static testmethod void RestrictContact(){
        List<Contact> conlist = new List<contact>();
        
         contact c1 = new contact(lastname = 'INVALIDNAME');
         contact c2 = new contact(lastname = 'ranjitad');
        conlist.add(c1);
        conlist.add(c2);
       // insert conlist;
        
        Test.startTest();
         Database.SaveResult[] srList = Database.insert(conList, false);
        Test.stopTest();
        for (Database.SaveResult sr : srList){
            if (!sr.isSuccess()) {
            for(Database.Error err : sr.getErrors()){
    		System.assertEquals('The Last Name "'+conList[0].lastname+'" is not allowed for DML', err.getMessage()); 
        }
           }
        }
        //system.assertEquals('The Last Name "'+conlist[0].LastName+'" is not allowed for DML',result.getErrors[0].getMessage);
       
    }
    
   
}