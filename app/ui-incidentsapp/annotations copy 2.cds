using incidentService as service from '../../srv/incidentService';

annotate service.Projects with @(
    UI.SelectionFields: [
        ID,
        Client
    ],
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Value: Name
        },
        {
            $Type: 'UI.DataField',
            Value: Client
        }
    ],
    UI.HeaderInfo     : {
        TypeName      : 'Projects',
        TypeNamePlural: 'Projects List',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Client
        }
    },
    UI.Facets         : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Project Data',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.Identification'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: 'Incidents/@UI.LineItem#incidents'
            }
        ]
    }],
    UI.Identification : [
        {
            $Type: 'UI.DataField',
            Value: Client
        },
        {
            $Type: 'UI.DataField',
            Value: Name
        },
        {
            $Type: 'UI.DataField',
            Value: StartDate
        },
        {
            $Type: 'UI.DataField',
            Value: EndDate
        },
        {
            $Type: 'UI.DataField',
            Value: Budget
        }
    ]
);


annotate service.Incidents with @(
    UI.LineItem #incidents           : [
        {
            $Type: 'UI.DataField',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Value: Project_ID
        },
        {
            $Type: 'UI.DataField',
            Value: Description
        },
        {
            $Type: 'UI.DataField',
            Value: Priority
        }
    ],
    UI.HeaderInfo                  : {
        TypeName      : 'Incident',
        TypeNamePlural: 'Incident Data',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        }
    },
    UI.Facets                      : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Incident Status',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.Identification#INCIDENTDATA',
                Label : 'Incident Status'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#updateStatus',
                Label : 'Incident Status'
            }
        ]
    }],
    UI.Identification #INCIDENTDATA: [
        {
            $Type: 'UI.DataField',
            Value: Employee_ID
        },
        {
            $Type: 'UI.DataField',
            Value: Employee.FirstName
        },
        {
            $Type: 'UI.DataField',
            Value: Employee.LastName
        },
        {
            $Type: 'UI.DataField',
            Value: Employee.Email
        },
        {
            $Type: 'UI.DataField',
            Value: Details.Status
        },
        {
            $Type: 'UI.DataField',
            Value: Priority
        }
    ],
    UI.FieldGroup #updateStatus    : {Data: [{
        $Type : 'UI.DataFieldForAction',
        Action: 'incidentService.updateStatus',
        Label : 'Update Status'
    }]}
);
