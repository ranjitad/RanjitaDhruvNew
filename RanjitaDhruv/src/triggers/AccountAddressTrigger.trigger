trigger AccountAddressTrigger on Account (before insert, before update) {
  List<account> acc = new List<account>();
  for(Account a: Trigger.New){
  if(a.BillingPostalCode != null && a.Match_Billing_Address__c == True){
        a.ShippingPostalCode = a.BillingPostalCode;
        acc.add(a);
  }  
       
  }
    
    
}