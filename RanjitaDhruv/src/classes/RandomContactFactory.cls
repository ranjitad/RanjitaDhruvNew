public class RandomContactFactory {
   
    public static List<Contact> generateRandomContacts(Integer noOfContacts, String lstname) {
         List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<noOfContacts;i++){
            Contact con = new Contact(firstname = 'Test'+i, lastname = lstname);
            conList.add(con);
        }
    return conList;
    }

}