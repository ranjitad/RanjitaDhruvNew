({
	createItem : function(component,item) {
		var itemEvent = component.getEvent("addItem");
        itemEvent.setParams({"item" : item});
        itemEvent.fire();
        component.set("v.newItem", {'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false });
        
        
	}
})