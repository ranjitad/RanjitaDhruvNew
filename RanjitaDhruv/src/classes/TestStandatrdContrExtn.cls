@isTest
public class TestStandatrdContrExtn {
 
 public static testmethod void standardControlExtn() {
		
		List<Registration__c> regList = new List<Registration__c>();
		Registration__c reg = new Registration__c(Name = 'testname', DOB__c = system.today(), Email__c = 'test56@test.com', Password__c = 'test', Confirm_Password__c = 'test');
		regList.add(reg);
		
		Registration__c reg1 = new Registration__c(Name = 'testname', DOB__c = system.today(), Email__c = 'test56@test.com');
		regList.add(reg1);

		Registration__c reg2 = new Registration__c(Name = 'testname', DOB__c = system.today(), Email__c = 'test56@test.com', Password__c = 'test');
		regList.add(reg2);
		
		Registration__c reg3 = new Registration__c(Name = 'testname', DOB__c = system.today(), Email__c = 'test56@test.com', Password__c = 'test', Confirm_Password__c = 'test1');
		regList.add(reg3);
		
		Registration__c reg4 = new Registration__c(Name = 'testname', DOB__c = system.today(), Email__c = 'test56@test.com', Password__c = 'test', Confirm_Password__c = 'test');
		regList.add(reg4);
		
		Registration__c reg5 = new Registration__c(Name = 'testname', DOB__c = system.today(), Email__c = 'test56@test.com', Password__c = 'test', Confirm_Password__c = 'test',country__c = 'India');
		regList.add(reg5);
		
		for(Registration__c regs : regList){
		ApexPages.StandardController sc = new ApexPages.StandardController(regs);
		
		LoginRegistrationContrl loginreg = new LoginRegistrationContrl(sc);
		
		loginreg.save();
		loginreg.clear();
		loginreg.showInfo();
		}			
		
	}   
}