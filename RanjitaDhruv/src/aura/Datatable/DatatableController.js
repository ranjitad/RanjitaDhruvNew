({
	doInit : function(component, event, helper) {
	
		helper.handleDoInit(component, event);
	},
	getSubset : function(component, event, helper) {
		helper.handleSubset(component, event);
	},
	getSelRows : function(component, event, helper) {
		helper.handleGetSelRows(component, event);
	},
	export : function(component, event, helper) {
		component.set("v.msg",'');
        component.set("v.msgType",'');
		helper.handleExport(component, event);
	},
	
	edit : function(component, event, helper) {
		component.set("v.msg",'');
        component.set("v.msgType",'');
		helper.handleEdit(component, event);
		
	},
	dynamic : function(cmp, event, helper) {
		
		$A.createComponent(
            "c:RecordsCreationComp",
            {},
            function(newCmp, status, errorMessage){
                //Add the new button to the body array
            	if (cmp.isValid && status === 'SUCCESS') {
                	console.log(status);
                    var body = cmp.get("v.body");
                    body.push(newCmp);
                    cmp.set("v.body", body);
                    console.log('body is '+body);
                    
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
		
	},
	
	close : function(cmp, event, helper) {
		debugger;
		cmp.set("v.body", '');
	},
})