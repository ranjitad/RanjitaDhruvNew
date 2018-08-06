@isTest
public class TestLoginHomeContrl {
	static testmethod void test1() {
		PageReference pageRef = Page.LoginHome;
		Test.setCurrentPage(pageRef);
		List<Registration__c> regList = new List<Registration__c>();
	    Registration__c reg = new Registration__c(Name = 'deepak',FirstName__c = 'ranj', Password__c = 'abc', Confirm_Password__c = 'abc', Email__c='ranj123@test.com');
	    regList.add(reg);
	    Registration__c reg1 = new Registration__c(Name = 'deepak',FirstName__c = 'ranj', Password__c = 'abc', Confirm_Password__c = 'abc', Email__c='ranj12@test.com');
	    regList.add(reg1);
	    insert regList;
		
		Test.StartTest();
		for(Registration__c regs : regList){
		ApexPages.currentPage().getParameters().put('id', String.valueOf(regs.Id));
		String nextPage;
		List<LoginHomeContrl> loginhme = new List<LoginHomeContrl>();
		LoginHomeContrl loginhome = new LoginHomeContrl();
		loginhome.username = 'ranj12@test.com';
		loginhome.password = 'abc';
		nextPage = loginhome.validateLogin().getUrl();
		loginhme.add(loginhome);
		
		LoginHomeContrl loginhome1 = new LoginHomeContrl();
		loginhome1.username = 'ranj12@test.com';
		loginhome1.password = '';
		
		loginhme.add(loginhome1);
		
		LoginHomeContrl loginhome2 = new LoginHomeContrl();
		loginhome2.username = 'ranj12@test.com';
		loginhome2.password = 'abcd';
		
		loginhme.add(loginhome2);
		
		LoginHomeContrl loginhome3 = new LoginHomeContrl();
		loginhome3.username = '';
		loginhome3.password = 'abcd';
		
		loginhme.add(loginhome3);
		LoginHomeContrl loginhome5 = new LoginHomeContrl();
		loginhome5.username = 'ranj346@test.com';
		loginhome5.password = 'abc';
		
		loginhme.add(loginhome5);
		
		for(LoginHomeContrl login : loginhme) {
				login.validateLogin();
								
		}
		System.assertEquals('/apex/welcome', nextPage);
		
						
		LoginHomeContrl loginhome4 = new LoginHomeContrl();
		loginhome4.username = 'ranj23@test.com';
		loginhome4.password = 'abcd';
		nextPage = loginhome4.cancel().getUrl();
		System.assertEquals('/apex/loginhome', nextPage);
		
	//	loginhome4.validateLogin(); 
				
				}
		Test.StopTest();
	}	
}