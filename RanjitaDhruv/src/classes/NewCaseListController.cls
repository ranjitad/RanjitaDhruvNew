Public class NewCaseListController{

Public List<Case> results;

Public List<Case> getNewCases(){

results = [select Id, CaseNumber from case where status = 'New'];

return results;

}

}