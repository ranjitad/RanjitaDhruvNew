({
clickReimbursed : function(component, event, helper) {
    var expense = component.get("v.expense");
    console.log("expense");
    var updateEvent = component.getEvent("updateExpense");
    updateEvent.setParams({ "expense": expense});
    updateEvent.fire();
}
})