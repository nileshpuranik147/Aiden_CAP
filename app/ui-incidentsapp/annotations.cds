using incidentService as myservice from '../../srv/incidentService';

annotate myservice.Projects with @(
    UI.SelectionFields: [
        Name,
        Client,
        ClientType,
        project_id
    ],

    UI.LineItem       : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'incidentService.EntityContainer/updateStatus',
            Label : 'Update Status'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'incidentService.myBoundAction',
            Label : 'My Bound Action'
        },
        {
            $Type: 'UI.DataField',
            Value: project_id
        },
        {
            $Type: 'UI.DataField',
            Value: Name
        },
        {
            $Type: 'UI.DataField',
            Value: Client
        },
        {
            $Type            : 'UI.DataField',
            Value            : Budget,
            ![@UI.Importance]: #High,
        }
    ],
    UI.HeaderInfo     : {
        TypeName      : '{i18n>Projects}',
        TypeNamePlural: '{i18n>Projects}',
        Title         : {
            $Type: 'UI.DataField',
            Value: project_id
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Name
        }
    },
    UI.Facets         : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.Identification'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'Incidents/@UI.LineItem#incidents'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'Employees/@UI.LineItem'
        }
    ],
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
        },
        {
            $Type: 'UI.DataField',
            Value: ClientType
        }
    ]
);

annotate myservice.Projects with {
    ID         @UI.Hidden;
    Name       @UI.MultiLineText;
    ClientType @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ClientTypes',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: ClientType,
                ValueListProperty: 'code'
            },
{
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }                                
            ]
        },
        Common.ValueListWithFixedValues: true
    )
};


annotate myservice.Incidents with @(

    UI.HeaderInfo         : {
        TypeName      : '{i18n>Incidents}',
        TypeNamePlural: '{i18n>Incidents}',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        }
    },
    UI.Identification     : [
        {
            $Type: 'UI.DataField',
            Value: incident_id
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
    UI.LineItem #incidents: [
        {
            $Type: 'UI.DataField',
            Value: incident_id
        },

        {
            $Type: 'UI.DataField',
            Value: Description
        },
        {
            $Type: 'UI.DataField',
            Value: Priority
        }
    ]
);

annotate myservice.Employees with @(
    UI.HeaderInfo    : {
        TypeName      : '{i18n>Employees}',
        TypeNamePlural: '{i18n>Employees}',
        Title         : {
            $Type: 'UI.DataField',
            Value: emp_id
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: FirstName
        }
    },
    UI.LineItem      : [
        {
            $Type: 'UI.DataField',
            Value: emp_id
        },
        {
            $Type: 'UI.DataField',
            Value: FirstName
        },
        {
            $Type: 'UI.DataField',
            Value: LastName
        },
        {
            $Type: 'UI.DataField',
            Value: Email
        },
        {
            $Type: 'UI.DataField',
            Value: Phone
        },
        {
            $Type: 'UI.DataField',
            Value: IsActiveEntity
        }
    ],
    UI.Identification: [
        {
            $Type: 'UI.DataField',
            Value: emp_id
        },
        {
            $Type: 'UI.DataField',
            Value: FirstName
        },
        {
            $Type: 'UI.DataField',
            Value: LastName
        },
        {
            $Type: 'UI.DataField',
            Value: Email
        },
        {
            $Type: 'UI.DataField',
            Value: Phone
        },
        {
            $Type: 'UI.DataField',
            Value: IsActiveEntity
        }
    ],
);
