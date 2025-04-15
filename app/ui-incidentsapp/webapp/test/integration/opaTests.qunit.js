sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/aiden/np/uiincidentsapp/test/integration/FirstJourney',
		'com/aiden/np/uiincidentsapp/test/integration/pages/ProjectsList',
		'com/aiden/np/uiincidentsapp/test/integration/pages/ProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectsList, ProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/aiden/np/uiincidentsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectsList: ProjectsList,
					onTheProjectsObjectPage: ProjectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);