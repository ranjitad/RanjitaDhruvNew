Public class ContactSearch{

 Public static List<Contact> searchForContacts(String last, String Postcode){

  List<Contact> con = [select Id,FirstName,LastName from contact where lastname=:last and MailingPostalCode=:Postcode];
  return con;
}
}