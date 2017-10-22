class suomen_spawner {

    class ambient {
            file = spawner\server\ambient;

            class createDefendParkingLot {};
            class createDriveBy {};
            class createGasStationAction {};
            class createGasStationDisembark {};
            class createGasStationDriveBy {};
            class createGoatCarrier {};
            class createGoats {};
            class createGMan {};
            class createHelicopter {};
            class createHeliFastrope {};
            class createJetFlyBy {};
            class createLightHouseFeed {};
            class createPoliceDriveBy {};
            class createTrashEater {};
            class createRepairVan {};
            class handleRepairVan {};
            class spawnDriveByDocs {};
            class spawnHunt {};
    };

    class american {
            file = spawner\server\american;

            class createChaser {};
            class createSingleAmerican {};
            class dropChaser {};
            class getAmericanLoadout {};
            class spawnAmericanZombieCrowd {};
            class spawnAmericanZombiesAlongRoads {};
    };

    class borderCrossing {
            file = spawner\server\borderCrossing;

            class border_checkVehicle {};
            class border_createBorderCrossing {};
            class border_directVehicle {};
            class border_getBorderCrossingVehicle {};
            class border_openBarGate {};
    };

    class civilian {
            file = spawner\server\civilian;

            class createSingleCivilian {};
            class createCivilianCrowd {};
            class createDoc {};
            class createPriest {};
            class createRandomCivilian {};
    };

    class enemies {
            file = spawner\server\enemies;

            class enemies_aceDamage {};
            class enemies_attackHuman {};
            class enemies_attackHumanOriginal {};
            class enemies_engageTarget {};
            class enemies_engageTargetOriginal {};
            class enemies_feedOnTargetAny {};
            class enemies_feedOnTargetOriginal {};
            class enemies_findTargetLoopOriginal {};
            class enemies_overwriteRZfunction {
                postInit = 1;
            };
    };

    class jussi {
            file = spawner\server\jussi;

            class createFakeJussi {};
            class createJussiCar {};
            class releaseJussi {};
            class shakeDatCar {};
    };

    class russian {
            file = spawner\server\russian;

            class getRussianLoadout {};
            class spawnRussianZombiesAlongRoads {};
    };

};
