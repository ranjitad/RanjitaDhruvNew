@isTest
public class TestWizardClass 
 {
	
	static testmethod void testwizard()
{
		PageReference pageRef = Page.reviewpage;
		Test.setCurrentPage(pageRef);
		Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        insert testAccount;
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.accountid = testAccount.id;
        insert cont;

		Opportunity opp = new Opportunity();
		opp.name='opportunity6';
		opp.stagename='qualification';
		opp.closedate = Date.today();
		opp.accountid=testAccount.id;
		insert opp;
		Test.StartTest();
		Wizard_class wzdclass = new Wizard_class();
		wzdclass.geta();
		wzdclass.getc();
		wzdclass.geto();
		wzdclass.PageAccount();
		wzdclass.PageContact();
		wzdclass.PageOpportunity();
		wzdclass.PageReview();
		wzdclass.save();
		Test.StopTest();
	}

    
}