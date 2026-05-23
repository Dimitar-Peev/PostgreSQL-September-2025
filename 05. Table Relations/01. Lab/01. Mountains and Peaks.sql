CREATE TABLE "mountains"
(
    "id"   SERIAL PRIMARY KEY NOT NULL,
    "name" VARCHAR(50)        NOT NULL
);

CREATE TABLE "peaks"
(
    "id"          SERIAL PRIMARY KEY NOT NULL,
    "name"        VARCHAR(50)        NOT NULL,
    "mountain_id" INT,

--  "mountain_id" INT REFERENCES "mountains" ("id") --  Short way without name
    CONSTRAINT fk_peaks_mountains -- Longer way with constraint name
        FOREIGN KEY ("mountain_id")
            REFERENCES "mountains" ("id")
);