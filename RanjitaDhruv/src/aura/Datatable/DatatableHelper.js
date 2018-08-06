({
	handleDoInit : function(cmp,event) {
		cmp.set("v.spinnerType","other");
		cmp.set("v.showSpinner",true);
        var action = cmp.get("c.initData");
        action.setParams({
        	objectName : cmp.get("v.objectName"),
        	fieldSetName : cmp.get("v.fieldSetName")
        });
        action.setCallback(this,function(res){
        	var state = res.getState();
        	if(state == 'SUCCESS') {
        		var response = res.getReturnValue();
        		console.log('**response.records: '+JSON.stringify(response.records));
        		console.log('**response.fields: '+JSON.stringify(response.fields));
        		cmp.set("v.records",response.records);
        		cmp.set("v.lastPageNumber",Math.ceil(cmp.get("v.records").length/cmp.get("v.limitSize")));
        		cmp.set("v.fields",response.fields);
        		this.handleSubset(cmp,event);
        	}
        	cmp.set("v.showSpinner",false);
        });
        $A.enqueueAction(action);
	},
	handleSubset : function(cmp,event) {
		var records = cmp.get("v.records");
		var limitSize = cmp.get("v.limitSize");
		var lastPageNumber = cmp.get("v.lastPageNumber");
		var pNumber = cmp.get("v.pNumber");
		var currentRecords = records.slice((pNumber -1) *  limitSize,limitSize * pNumber);
		cmp.set("v.currentRecords",currentRecords);
	},
	handleGetSelRows : function(cmp,event) {
		cmp.set("v.selectedRows",event.getParam('selectedRows'));
		//console.log('***sel rows: '+event.getParam('selectedRows'));
	},
	handleExport : function(cmp,event) {
		var records = cmp.get("v.selectedRows"); 
		if(records.length > 0) {
			debugger;
			// call the helper function which "return" the CSV data as a String   
	        var csv = this.convertArrayOfObjectsToCSV(cmp,records,cmp.get("v.fields"));   
	        if (csv == null){return;} 
	        
	        // ####--code for create a temp. <a> html tag [link tag] for download the CSV file--####     
		     var hiddenElement = document.createElement('a');
	          hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
	          hiddenElement.target = '_self'; // 
	          hiddenElement.download = 'ExportData.csv';  // CSV file Name* you can change it.[only name not .csv] 
	          document.body.appendChild(hiddenElement); // Required for FireFox browser
	    	  hiddenElement.click(); // using click() js function to download csv file
    	  }
    	  else {
              cmp.set("v.msg",$A.get("$Label.c.DatatableNoSelMsg"));
              cmp.set("v.msgType",'error');
    	  }
	},
	
	handleEdit : function(cmp,event) {
		var records = cmp.get("v.selectedRows"); 
		if(records.length > 0) {
			cmp.set("v.IsEdit",true);
			cmp.set("v.msg",'');
    	  }
    	  else {
              cmp.set("v.msg",$A.get("$Label.c.DatatableNoSelMsg"));
              cmp.set("v.msgType",'error');
    	  }
	}, 
	convertArrayOfObjectsToCSV : function(cmp,objectRecords, fields){
		debugger;
        // declare variables
        var csvStringResult, counter, keys = [], columnDivider, lineDivider;
       
        // check if "objectRecords" parameter is null, then return from function
        if (objectRecords == null || !objectRecords.length) {
            return null;
         }
        // store ,[comma] in columnDivider variabel for sparate CSV values and 
        // for start next line use '\n' [new line] in lineDivider varaible  
        columnDivider = ',';
        lineDivider =  '\n';
 
        // in the keys valirable store fields API Names as a key 
        // this labels use in CSV file header 
        for(var i=0; i < fields.length; i++) { 
        	keys.push(fields[i].fieldName);
        }
        
        csvStringResult = '';
        csvStringResult += keys.join(columnDivider);
        csvStringResult += lineDivider;
 
        for(var i=0; i < objectRecords.length; i++){   
            counter = 0;
           
             for(var sTempkey in keys) {
                var skey = keys[sTempkey] ;  
 
              // add , [comma] after every String value,. [except first]
                  if(counter > 0){ 
                      csvStringResult += columnDivider; 
                   }   
               
               csvStringResult += '"'+ objectRecords[i][skey]+'"'; 
               
               counter++;
 
            } // inner for loop close 
             csvStringResult += lineDivider;
          }// outer main for loop close 
       
       // return the CSV formate String 
        return csvStringResult;        
    }
})