class suomen_fx {

    class crows_client {
            file = fx\crows\client;

            class crowCircle {};
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

     class earthquake_client {
            file = fx\earthquake;

            class earthquake {};
    };

	class explosion_client {
		file = fx\explosion\client;

            class addInteractionBomb {};
            class fogMoving {};
            class nukeClient {};
            class setViewDistance {};
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

    class police {
            file = fx\police\client;

            class addBlueLight {};
    };

    class radio {
            file = fx\radio;

            class createRadio {};
    };
};
