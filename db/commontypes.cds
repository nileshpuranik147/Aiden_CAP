namespace myns.commons;

type Guid: String(32);

type roleMenu: String(15) enum{
    L1 = 'Level 1';
    L2 = 'Level 2';
    L3 = 'Level 3';
}
type incidentStatus: String(8) enum{
    O = 'Open';
    H = 'Hold';
    C = 'Close';
}

type incidentPriority: String(8) enum{
    P1 = 'High';
    P2 = 'Medium';
    P3 = 'Low';
}

aspect incidentdetails{
    START_DATE: Date;
    END_DATE: Date;
    SEVERITY: incidentPriority;
    STATUS: incidentStatus;
}
