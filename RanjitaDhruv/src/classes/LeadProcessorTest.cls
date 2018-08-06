@istest
public class LeadProcessorTest {

 Public static testmethod void test() { 
        List<Lead> Leadlist = new List<Lead>();
         // insert 150 Leads
        for (Integer i=0;i<150;i++) {
            Leadlist.add(new Lead(lastname='last '+i, company = 'abc')); 
          }              
            insert Leadlist;
             
        Test.startTest();
        LeadProcessor Ld = new LeadProcessor();
        Id batchId = Database.executeBatch(ld);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        List<lead> ld1 = [Select Leadsource from lead where Id in : Leadlist];
        for(Lead l: ld1){
           System.assertEquals('Dreamforce',l.leadsource ); 
        }
    }
    }