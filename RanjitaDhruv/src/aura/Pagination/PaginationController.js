({
	onButtonClick : function(cmp, event, helper) {
        
      //  console.log('LastPageNumber : '+LastPageNumber);
        var buttonType;
        if(event.getSource)
              buttonType = event.getSource().get("v.label");
        else
              buttonType = event.target.innerHTML;
        
         console.log('Button Name : '+buttonType);
        if(buttonType == 'First')
            cmp.set("v.PageNumber",1);
        else if(buttonType == 'Previous')
            cmp.set("v.PageNumber",cmp.get("v.PageNumber")-1);
        else if(buttonType == 'Next')
            cmp.set("v.PageNumber",cmp.get("v.PageNumber")+1);
        else if(buttonType == 'Last')
            cmp.set("v.PageNumber",cmp.get("v.LastPageNumber"));
	}
})