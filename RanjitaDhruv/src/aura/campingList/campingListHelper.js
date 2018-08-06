({
	handleAddItem : function(component,itemNew) {
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