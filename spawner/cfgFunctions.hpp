class suomen_spawner {

    class ambient {
            file = spawner\server\ambient;

            class createDriveBy {};
            class createHelicopter {};
            class spawnDriveByDocs {};
    };

    class american {
            file = spawner\server\american;

            class getAmericanLoadout {};
            class spawnAmericanZombieCrowd {};
            class spawnAmericanZombiesAlongRoads {};
    };

    class civilian {
            file = spawner\server\civilian;

            class createCivilianCrowd {};
            class createDoc {};
            class createPriest {};
            class createRandomCivilian {};
    };

    class jussi {
            file = spawner\server\jussi;

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
