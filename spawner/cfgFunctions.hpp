class suomen_spawner {

    class ambient {
            file = spawner\server\ambient;

            class createHelicopter {};
    };

    class american {
            file = spawner\server\american;

            class spawnAmericanZombieCrowd {};
            class spawnAmericanZombieCrowd2 {};
            class spawnAmericanZombieCrowd3 {};
            class spawnAmericanZombiesAlongRoads {};
    };

    class civilian {
            file = spawner\server\civilian;

            class createCivilianCrowd {};
            class createDoc {};
            class createPriest {};
            class createRandomCivilian {};
    };

    class russian {
            file = spawner\server\russian;

            class spawnRussianZombiesAlongRoads {};
            class spawnRussianZombiesInCircle {};
    };
};
