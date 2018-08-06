({
    packItem : function(component, event, helper) {
        var a= component.get("v.item");
        a.Packed__c= true;
        var b = event.getSource().get("v.label");
        component.set("v.item", b);
        component.set("v.disabled", true);
    }
})