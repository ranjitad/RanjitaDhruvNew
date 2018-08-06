({
    doInit: function(component,event,helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set("v.items", response.getReturnValue());
            }
            else 
                console.log("Failed "+ state);
        });
        
        $A.enqueueAction(action);
    },
    
    handleAddItem : function(component,event,helper) {
        var item = event.getParam("item");
        helper.createItem(component,item);
        
    },
    createItem : function(component,itemNew) {
		var action = component.get("c.saveItem");
        action.setParams({"itemNew":itemNew});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(component.isValid() && state == "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items",items);
            }
            else
                console.log("Failed state" + state);
        });
        $A.enqueueAction(action);
	}
    
    
})