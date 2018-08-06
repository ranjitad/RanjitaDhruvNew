({
	createExpense : function(component, expense) {
	/*	var theExpenses = component.get("v.expenses");
        
        var newExpense = JSON.parse(JSON.stringify(expense));
        console.log("Expenses before 'create': " + JSON.stringify(theExpenses));
        theExpenses.push(newExpense);
        component.set("v.expenses", theExpenses);
        console.log("Expenses after 'create': " + JSON.stringify(theExpenses));   */
        
        var action = component.get("c.saveExpense");
        action.setParams({"expense": expense
                         });
        action.setCallback(this,function(response){
            var state = response.getState();
            	if(state == "SUCCESS"){
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses",expenses);
            }
        });
        $A.enqueueAction(action);
	},
    
    updateExpense: function(component, expense) {
        var action = component.get("c.saveExpense");
        action.setParams({ "expense": expense });
       
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                // do nothing!
            }
        });
        $A.enqueueAction(action);
    },
})