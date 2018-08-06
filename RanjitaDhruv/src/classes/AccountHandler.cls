public class AccountHandler {
       
    public static Account insertNewAccount(String input){
                 
        Account acc = new Account();
        acc.name = input;
        try{
            insert acc;
        } catch(exception e){
             return null;
        }
        return acc;
     }   
    
}