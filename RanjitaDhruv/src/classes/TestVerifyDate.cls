@isTest

public class TestVerifyDate {
    
    Public static testmethod void CheckDates1(){
       Date StartDate = date.newInstance(2018, 01, 10);
       Date Enddate = date.newInstance(2018, 02, 08);
      Date Checktest1 = VerifyDate.CheckDates(StartDate, Enddate);
      system.assertEquals(Enddate, Checktest1);
    }
    
    Public static testmethod void CheckDates2(){
       Date StartDate = date.newInstance(2018, 01, 10);
       Date Enddate = date.newInstance(2018, 01, 08);
       Integer totalDays = Date.daysInMonth(StartDate.year(), StartDate.month());
       Date lastDay1 = Date.newInstance(StartDate.year(), StartDate.month(), totalDays); 
       Date Checktest2 = VerifyDate.CheckDates(StartDate, Enddate);
       System.assertEquals(lastDay1, Checktest2);
    }


}