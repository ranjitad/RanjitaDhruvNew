({
	handleOnSave : function(cmp, event) {
		debugger;
		var records = cmp.get("v.rowsToUpd");
		console.log(JSON.stringify(records));
		var action = cmp.get("c.save");
		action.setParams({
			records : records
		});
		action.setCallback(this,function(response) {
			var state = response.getState();
			if(state == 'SUCCESS') {
				var res = response.getReturnValue();
				  cmp.set("v.msg",res);
                if(res.startsWith('Error'))
                	cmp.set("v.msgType",'error');
                else
                	cmp.set("v.msgType",'success');
			}
			else {
				cmp.set("v.msg",'Error.');
				cmp.set("v.msgType",'error');
			}
		});
		$A.enqueueAction(action);
	}
})