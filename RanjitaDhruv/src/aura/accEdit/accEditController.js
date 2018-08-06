({
    handleSaveRecord: function(component, event, helper) {
        component.find("recordEdit").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                console.log("Save completed successfully.");
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
            	      var errMsg = "";
                     // saveResult.error is an array of errors, 
                     // so collect all errors into one message
                     for (var i = 0; i < saveResult.error.length; i++) {
                         errMsg += saveResult.error[i].message + "\n";
                     }
                     cmp.set("v.recordSaveError", errMsg);
                 } 
            else {
                     cmp.set("v.recordSaveError", "");
                 }
                console.log('Problem saving record, error: ' + 
                		errMsg);
           
        }));}
})