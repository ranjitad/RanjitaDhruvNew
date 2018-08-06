public class fieldInfo {
       @AuraEnabled public String label;
       @AuraEnabled public String fieldName;
       @AuraEnabled public String type;
       
       public fieldInfo(String label, String fieldName, String type) {
            this.label = label;
            this.fieldName = fieldName;
            this.type = type.toLowerCase();
       }
    }