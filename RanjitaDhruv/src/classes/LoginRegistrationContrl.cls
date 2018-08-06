public class LoginRegistrationContrl {
    Registration__c reg = new Registration__c();
    public String countryInfo {get;set;}
    public LoginRegistrationContrl(ApexPages.StandardController Con){
    	countryInfo = '';
        reg = (Registration__c) con.getRecord();
    }
    
    public pageReference save(){
        pageReference pr; // by default pr is null returns to same page
        if(reg.Password__c == null || reg.Password__c == ''){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'Please enter password'));
        }
        else {
                if(reg.Confirm_Password__c == null || reg.Confirm_Password__c == ''){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'Please enter confirm password'));
                }
                else{
                        if(reg.Password__c != reg.Confirm_Password__c){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'password and confirm password should be same'));
                        }       
                        else{
                                try{
                                        insert reg;
                                        pr = page.Loginsuccess;
                                }
                                catch(Exception e){
                                        String errorMsg = '';
                                        if(e.getMessage().contains('DUPLICATE_VALUE, duplicate value found: Email__c')){
                                                errorMsg = 'Username already exist';
                                        }
                                        else{
                                                errorMsg = e.getMessage();
                                        }
                                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, errorMsg));
                                }
                        }
                }
        }
        return pr;
    }
    public pageReference clear(){
        pageReference pr = page.LoginRegistration;
        pr.setRedirect(true);
        return pr;
    }
    
    public void showInfo() {
    	if(reg.country__c == 'India')
    	countryInfo ='India is a big Country';
    	else
    	countryInfo = '';
    }
}