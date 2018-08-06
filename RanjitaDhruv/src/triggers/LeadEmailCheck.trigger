trigger LeadEmailCheck on Lead (before insert,before update) {
	Set<String> leadEmail = new Set<String>();
    for(Lead l : trigger.new) {
        if(l.Email !=null)
        leadEmail.add(l.Email);
    }
    
    List<Contact> conList = [select id, email from contact where email in : leadEmail];
  	Map<String,Contact> mapContact = new  Map<String,Contact>();
    for(Contact c : conList) {
        mapContact.put(c.Email,c);
      }
    
    for(Lead l : trigger.new){
        if(mapContact.containsKey(l.Email)){
             l.addError('Email address already exists for another contact');
        }
                     
    } 
    
            
}