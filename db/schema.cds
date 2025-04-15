namespace mynsdb;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';
using {myns.commons as common} from './commontypes';

@cds.odata.valuelist
entity ClientTypes: CodeList{
    key code: String(1);
}

entity Projects : managed {
    key ID        : UUID    @title: '{i18n>project.id}';
        project_id : common.Guid @title: '{i18n>project.id}';
        Name      : String(100)    @title: '{i18n>project.name}';
        Client    : String(100)    @title: '{i18n>project.client}';
        StartDate : Date           @title: '{i18n>project.startdate}';
        EndDate   : Date           @title: '{i18n>project.enddate}';
        Budget    : Decimal(15, 2) @title: '{i18n>project.budget}';
        ClientType : String(1)  @title:'{i18n>project.clienttype}';
        // Many-to-Many Relationship handled via EmployeeProjects entity
        Employees : Association to many Employees
                        on Employees.Projects = $self;

        // A project can have multiple incidents (incidents)
        Incidents : Composition of many Incidents
                        on Incidents.Projects = $self;
}

entity Employees : managed {
    key ID        : UUID            @title: '{i18n>Employees.id}';
        emp_id    : common.Guid     @title: '{i18n>Employees.emp_id}';
        FirstName : String(50)      @title: '{i18n>Employees.firstname}';
        LastName  : String(50)      @title: '{i18n>Employees.last_name}';
        Email     : String(100)     @title: '{i18n>Employees.email}';
        Phone     : String(20)      @title: '{i18n>Employees.phone }';
        Role      : common.roleMenu @title: '{i18n>Employees.role}';
        Projects  : Association to Projects;
        Incidents : Association to many Incidents
                        on Incidents.Employees = $self;
}


entity Incidents : managed {
    key ID          : UUID                    @title: '{i18n>Incidents.id}';
        incident_id : common.Guid             @title: '{i18n>Incidents.inc_id}';
        Description : String(255)             @title: '{i18n>Incidents.description}';
        Priority    : common.incidentPriority @title: '{i18n>Incidents.priority}';
        CreatedOn   : DateTime                @title: '{i18n>Incidents.createdon}';
        UpdatedOn   : DateTime                @title: '{i18n>Incidents.updatedon}';
        Projects    : Association to Projects; // Unique project assignment
        Employees   : Association to Employees; // Unique employee assignment
        // Each incident has details stored in Transaction
        Details     : Association to one IncidentDetails
                          on Details.Incident = $self;
}


entity IncidentDetails : managed {
    key ID                 : UUID                  @title: '{i18n>Incidentdetails.id}';
        incidentdetails_id : common.Guid           @title: '{i18n>Incidentdetails.incdet_id}';
        ReportedBy         : String(100)           @title: '{i18n>Incidentdetails.reportedby}';
        ReportedOn         : DateTime              @title: '{i18n>Incidentdetails.reportedon}';
        Status             : common.incidentStatus @title: '{i18n>Incidentdetails.status}'; // Status column as per requirement
        ResolutionNotes    : String(500)           @title: '{i18n>Incidentdetails.Notes}';
        LastUpdatedBy      : String(100)           @title: '{i18n>Incidentdetails.Lastupdatedby}';
        Incident           : Association to one Incidents;
}

entity EmployeeProjects : managed {
    key ID         : UUID;
        Role       : common.roleMenu @title: '{i18n>EmployeeProjects.role}';
        AssignedOn : DateTime        @title: '{i18n>EmployeeProjects.AssignedOn}';
        UpdatedOn  : DateTime        @title: '{i18n>EmployeeProjects.UpdatedOn}';
        Projects    : Association to Projects; // Unique project assignment
        Employees   : Association to Employees; // Unique employee assignment        
}
