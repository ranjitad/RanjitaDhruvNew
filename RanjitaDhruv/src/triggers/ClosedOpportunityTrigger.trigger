trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
  
       List<task> tasklist = new List<task>();
       
     for(opportunity opp: Trigger.new)
     {
         if(Trigger.Isinsert){
          if(opp.stagename =='Closed Won'){
          tasklist.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
       }
     }  
            
         if(Trigger.Isupdate){
         if(opp.stagename == 'Closed Won' && opp.stagename != Trigger.oldmap.get(opp.Id).Stagename){
         tasklist.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
       }
     }  
     
   }
   
   if(tasklist.size()>0){
     insert tasklist;
     }
    
 }