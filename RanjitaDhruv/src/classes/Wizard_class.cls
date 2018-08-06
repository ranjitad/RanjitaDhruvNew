Public Class Wizard_class{

Account a = new Account();
Contact c = new Contact();
Opportunity o = new Opportunity();

Public Account geta() {
return a;
}

public Contact getc() {
return c;
}
Public Opportunity geto() {
return o;
}

Public PageReference PageAccount(){
  return Page.AccountPage;
}

Public Pagereference PageContact(){
   return page.ContactPage;
}

Public Pagereference PageOpportunity(){
   return Page.OpportunityPage;
}

Public Pagereference PageReview(){
   return Page.reviewpage;
}

Public Pagereference save(){
   try{
       insert a;
   } catch(exception e){
       system.debug('Exception is '+ e.getMessage());
   }
   c.AccountID = a.ID;
   try{
       insert c;
   } catch(exception e){
       system.debug('Exception is '+ e.getMessage());
   }
   
   o.AccountID = a.ID;
   try{
       insert o;
   } catch(exception e){
       system.debug('Exception is '+ e.getMessage());
   }
      return null;
}   

}