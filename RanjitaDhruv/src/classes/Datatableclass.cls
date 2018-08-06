public with sharing class Datatableclass {
	/*@AuraEnabled
    public static List<Opportunity> getRecords() {
    	return [select Name, StageName, Amount, CloseDate from Opportunity Limit : Limits.getLimitQueryRows()];
    }
    
    @AuraEnabled
    public static List<String> getFields() {
    	return null;
    }*/
    @AuraEnabled
    public static Map<String,Object> initData(String objectName, String fieldSetName) {
    	Map<String,Object> contrlRes = new Map<String,Object>{
    		'records' => null,
    		'fields' => null
    	};
    	List<FieldInfo> fields = Utility.getFieldSetFields(objectName, fieldSetName);
    	system.debug('***fields: '+fields);
    	contrlRes.put('fields',fields);
    	String fieldStr = Utility.getFieldsStr(fields);
    	system.debug('***fieldStr: '+fieldStr);
    	String query = 'select  '+fieldStr+' from '+objectName+' Limit '+Limits.getLimitQueryRows();
    	system.debug('***query: '+query);
    	contrlRes.put('records',Database.query(query));  	
    	return contrlRes;
    }
    
     @AuraEnabled
     public static String save(List<Sobject> records) {
    	String msg = '';
        Schema.SObjectType sObjectType = records[0].getSObjectType();
        system.debug('sObjectType: '+sObjectType);
        if (sObjectType != null) {
            String listType = 'List<' + sObjectType + '>';
            List<SObject> castRecords = (List<SObject>)Type.forName(listType).newInstance();
            castRecords.addAll(records);
            try {
    			upsert castRecords;
    			msg = 'Records have been saved successfully.';
    		}
    		catch(Exception e) {
    			msg = 'Error:' + e.getMessage();
    		}
        }
    	return msg;
    }
}