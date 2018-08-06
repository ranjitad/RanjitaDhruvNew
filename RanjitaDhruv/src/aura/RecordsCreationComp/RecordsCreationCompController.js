({
	onClose : function(cmp, event, helper) {
		debugger;
		var compEvent = cmp.getEvent("recsClsEnt");
		compEvent.fire();
	},
	onSelect : function(cmp, event, helper) {
		//var selVal = cmp.get("v.selVal");
	}
})