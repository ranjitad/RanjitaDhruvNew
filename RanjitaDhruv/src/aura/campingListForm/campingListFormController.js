({
	clickCreateItem : function(component, event, helper) {
		var validItem = component.find('newitemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validItem) {
            var itemNew = component.get("v.newItem");
            helper.createItem(component,itemNew);
      /*    var allItems = component.get("v.items");
            var item = JSON.parse(JSON.stringify(itemNew));
            allItems.push(item);
            component.set("v.items",allItems);
            component.set("v.newItem",{'sobjectType': 'Camping_Item__c',
                                       'Name':'','Price__c':'0',
                                       'Quantity__c':'0','Packed':false}); */
            
            
            
        }
	},
})