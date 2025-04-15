using mynsdb as myschema from '../db/schema';

service incidentService {
   @odata.draft.enabled
    entity Projects as projection on myschema.Projects 
        actions {
            action myBoundAction(input : String) returns Boolean;
        };
@odata.draft.enabled
entity Employees        as    projection on myschema.Employees;

entity EmployeeProjects as projection on myschema.EmployeeProjects;

entity Incidents        as    projection on myschema.Incidents ;
@odata.draft.enabled
entity IncidentDetails  as    projection on myschema.IncidentDetails;

@readonly
entity ClientTypes as projection on myschema.ClientTypes;

action uploadData() returns Boolean;
action   updateStatus() returns IncidentDetails;
function checkStatus()  returns Boolean;

}
