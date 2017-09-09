class suomen_mission {

    class ai_client {
            file = missionFlow\functions\client;

            class debugKnowsAbout;
            class endMission;
    };

    class ai_server {
            file = missionFlow\functions\server;

            class changeSides;
            class createReinforcements;
            class createReinforcementsNE;
            class deleteAllUnitsInTrigger;
            class disembarkAndTurn;
            class getPathNE;
            class makeAllRedBlue;
            class setupGroupIds;
            class setTaskTrigger;
            class turnOver;
    };
};

