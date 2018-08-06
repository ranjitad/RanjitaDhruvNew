({
	doInit : function(cmp,event,helper) {
		var records = cmp.get("v.selectedRows");
		var fields = cmp.get("v.fields");
		for(i = 0 ; i < records.length ; i++) {
			records[i].entries = [];
			for(j=0 ; j< fields.length ; j++) {
				records[i].entries.push({ label : fields[j].label, 
					                  fieldName : fields[j].fieldName,
					                  type : fields[j].type,
					                  value : records[i][fields[j].fieldName], });
			}
		}
		//console.log(JSON.stringify(records));
		cmp.set("v.selectedRows",records);
	},
	
	closeModel : function(cmp,event,helper) {
		cmp.set("v.msg",'');
        cmp.set("v.msgType",'');
		cmp.set("v.IsEdit",false);
		//alert("check");
		debugger;
		var compEvent = cmp.getEvent("InputFormEvent");
		// Optional: set some data for the event (also known as event shape)
		// A parameter’s name must match the name attribute
		// of one of the event’s <aura:attribute> tags
		// compEvent.setParams({"myParam" : myValue });
		//console.log(compEvent);
		compEvent.fire();
		
	},
	
	onSave : function(cmp, event, helper) {
		//var input = document.getElementById("0").getElementsByTagName("td")[0].getElementsByClassName("slds-input")[0];
		//alert(input.type);
		debugger;
		var records = cmp.get("v.selectedRows");
		var recSize = records.length;
		var recs = [];
		for(var i=0;i< recSize; i++) {
			var tds = document.getElementById(i).getElementsByTagName("td");
            var json = {};
            json['Id'] = records[i].Id;
            json['sObjectType'] = cmp.get("v.objectName");
			for(var j=0;j<tds.length;j++) {
                var type = tds[j].getElementsByClassName("slds-input")[0].placeholder;
				//console.log(type);
                var val = tds[j].getElementsByClassName("slds-input")[0].value;
                json[tds[j].getElementsByClassName("slds-input")[0].id] = (type == 'double' || type == 'currency') ? parseInt(val) : val;
			}
			console.log('*** json:** '+JSON.stringify(json));
			recs.push(json);			
		}
		//console.log('### recs: '+JSON.stringify(recs));
		cmp.set("v.rowsToUpd",recs);
		helper.handleOnSave(cmp, event);
	}
})