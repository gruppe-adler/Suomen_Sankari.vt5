class suomen_fx {

    class crows_client {
            file = fx\crows\client;

            class crowCreate {};
            class crowGetWp {};
            class crowLoop {};
            class crowMoveNear {};
            class crowMoveTo {};
            class setBirdTarget {};
            class startleBirds {};
    };

    class crows_server {
            file = fx\crows\server;

            class initCrows {};
            class registerShot {};
    };

	class explosion_client {
		file = fx\explosion\client;

                class addInteractionBomb {};
                class fogMoving {};
                class nukeClient {};
                class setFog {};
                class steamLeak {};

	};

	class explosion_server {
		file = fx\explosion\server;

                class bombLoop {};
                class explosiveDetonation {};
                class explosivePlanted {};
                class nukeServer {};
	};

    class fire {
            file = fx\fire\client;

            class createFire {};
            class createLight {};
            class createParticles {};
            class handleLoop {};
    };

    class flies {
            file = fx\flies\client;

            class flies {};
    };

    class gas {
            file = fx\gas\client;

            class gasEffectsAdd {};
            class gasEffectsReset {};
    };
};
