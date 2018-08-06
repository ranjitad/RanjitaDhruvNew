public with sharing class Utility {
    public static List<FieldInfo> getFieldSetFields(String objectName, String fieldSetName) {   
    	List<FieldInfo> fields = new List<FieldInfo>();
    	system.debug('***objectName: '+objectName);
    	system.debug('***fieldSetName: '+fieldSetName);
    	for(Schema.FieldSetMember fsm : Schema.getGlobalDescribe().get(ObjectName).getDescribe().FieldSets.getMap().get(fieldSetName).getFields()) {
    		FieldInfo fInfo = new FieldInfo(fsm.getLabel(), fsm.getFieldPath(), fsm.getType().name());
    		fields.add(fInfo);
    	} 	
    	return fields;
    }
    public static String getFieldsStr(List<FieldInfo> fields) {
    	String result = '';
    	for(FieldInfo fInfo : fields) {
    		result += fInfo.fieldName+',';
    	}
    	result = result.subString(0,result.length()-1);
    	return result;
    }
}