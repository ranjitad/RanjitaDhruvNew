public class AccountProcessor
{
  @future
  public static void countContacts(Set<id> setId)
  {
      List<Account> acclist = [select Id, Number_of_Contacts_c__c, (select id from contacts ) from account where id in :setId ];
      for( Account acc : acclist)
   {
          List<Contact> conlist = acc.contacts ;
           
          acc.Number_of_Contacts_c__c = conlist.size();
   }
     update acclist;
  }
}