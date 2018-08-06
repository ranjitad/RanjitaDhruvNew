Public class ContactAndLeadSearch{

 public static List<List<SObject>> searchContactsAndLeads(String input){
 
 List<List<SObject>> searchcontlead = [Find :INPUT IN NAME FIELDS RETURNING CONTACT(NAME), LEAD(FIRSTNAME)];
 return searchcontlead;
 
 }
 
 }