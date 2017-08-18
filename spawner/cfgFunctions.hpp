class suomen_spawner {

    class ambient {
            file = spawner\server\ambient;

            class createHelicopter {};
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

            class createJussi {};
    };

    class russian {
            file = spawner\server\russian;

            class getRussianLoadout {};
            class spawnRussianZombiesAlongRoads {};
    };

};
