public class StringArrayTest{
    public static List<String> generateStringArray(integer n){
     List<string> testarray = new List<string>();   
        for(integer i=0;i<n;i++){
           testarray.add('Test '+i);
           system.debug(testarray[i]);
        }
        return testarray;
    }
}