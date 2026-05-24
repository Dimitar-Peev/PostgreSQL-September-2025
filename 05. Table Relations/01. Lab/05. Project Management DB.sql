CREATE TABLE public."clients"
(
    "id"   INTEGER PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL
);

CREATE TABLE public."projects"
(
    "id"              INTEGER PRIMARY KEY,
    "client_id"       INTEGER,
    "project_lead_id" INTEGER,

    CONSTRAINT fk_projects_clients
        FOREIGN KEY ("client_id")
            REFERENCES public."clients" ("id")
);

CREATE TABLE public."employees"
(
    "id"         INTEGER PRIMARY KEY,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name"  VARCHAR(30) NOT NULL,
    "project_id" INTEGER,

    CONSTRAINT fk_employees_projects
        FOREIGN KEY ("project_id")
            REFERENCES public."projects" ("id")
);

ALTER TABLE public."projects"
    ADD CONSTRAINT fk_projects_employees
        FOREIGN KEY ("project_lead_id")
            REFERENCES public."employees" ("id");