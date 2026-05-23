DROP DATABASE IF EXISTS "camp_db";

CREATE DATABASE "camp_db";

CREATE TABLE "rooms"
(
    "id"         SERIAL PRIMARY KEY,
    "occupation" VARCHAR(20) NOT NULL,
    "beds_count" INT         NOT NULL
);

CREATE TABLE "vehicles"
(
    "id"           SERIAL PRIMARY KEY NOT NULL,
    "driver_id"    INT                NOT NULL,
    "vehicle_type" VARCHAR(30)        NOT NULL,
    "passengers"   INT                NOT NULL
);

CREATE TABLE "campers"
(
    "id"         SERIAL PRIMARY KEY,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name"  VARCHAR(20) NOT NULL,
    "age"        INT         NOT NULL,
    "room"       INT,
    "vehicle_id" INT,

    CONSTRAINT fk_room_id
        FOREIGN KEY ("room")
            REFERENCES "rooms" ("id"),

    CONSTRAINT fk_vehicle_id
        FOREIGN KEY ("vehicle_id")
            REFERENCES "vehicles" ("id")
            ON DELETE CASCADE
);

CREATE TABLE "routes"
(
    "id"          SERIAL PRIMARY KEY,
    "start_point" VARCHAR(30) NOT NULL,
    "end_point"   VARCHAR(30) NOT NULL,
    "leader_id"   INT         NOT NULL,
    "route_time"  TIME        NOT NULL,

    CONSTRAINT fk_leader_id
        FOREIGN KEY ("leader_id")
            REFERENCES "campers" ("id")
);

INSERT INTO "rooms"("id", "occupation", "beds_count")
VALUES (101, 'occupied', 3),
       (102, 'free', 3),
       (103, 'free', 3),
       (104, 'free', 2),
       (105, 'free', 2),
       (201, 'free', 3),
       (202, 'free', 3),
       (203, 'free', 2),
       (204, 'free', 3),
       (205, 'free', 3),
       (301, 'free', 2),
       (302, 'free', 2),
       (303, 'free', 2),
       (304, 'free', 3),
       (305, 'free', 3);

INSERT INTO "campers"("first_name", "last_name", "age", "room")
VALUES ('Simo', 'Sheytanov', 20, 101),
       ('Roli', 'Dimitrova', 27, 102),
       ('RoYaL', 'Yonkov', 25, 301),
       ('Ivan', 'Ivanov', 28, 301),
       ('Alisa', 'Terzieva', 25, 102),
       ('Asya', 'Ivanova', 26, 102),
       ('Dimitar', 'Verbov', 21, 301),
       ('Iskren', 'Ivanov', 28, 302),
       ('Bojo', 'Gevechanov', 28, 302);

INSERT INTO "vehicles"("driver_id", "vehicle_type", "passengers")
VALUES (1, 'bus', 20),
       (2, 'van', 10),
       (1, 'van', 10),
       (4, 'car', 5),
       (5, 'car', 5),
       (6, 'car', 4),
       (7, 'car', 3),
       (8, 'bus', 3);

INSERT INTO "routes"("start_point", "end_point", "leader_id", "route_time")
VALUES ('Hotel Malyovitsa', 'Malyovitsa Peak', 3, '02:00:00'),
       ('Hotel Malyovitsa', 'Malyovitsa Hut', 3, '00:40:00'),
       ('Ribni Ezera Hut', 'Rila Monastery', 3, '06:00:00'),
       ('Borovets', 'Musala Peak', 4, '03:30:00');