public class LoginHomeContrl {
    public String username {get;set;}
    public String password {get;set;}
    
    public pageReference validateLogin(){
        pageReference pr;
        if(username == null || username == ''){
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'Please enter username'));
        }
        else{
            if(password == null || password == ''){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'Please enter password'));
            }
            else{
                List<Registration__c> regList = [select email__c, password__c from registration__c where email__c =:username LIMIT 1];
                if(regList == null || regList.size() == 0){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'Usename doesn\'t exist'));
                }
                else{
                    if(regList[0].password__c != password){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error, 'Password is wrong'));
                    }
                    else{
                        pr = page.Welcome;
                    }
                }
            }
        }
        return pr;
    }
    
    public pageReference cancel(){
    	pageReference pr = page.LoginHome;
    	pr.setRedirect(true);
    	return pr;
    }
    
}