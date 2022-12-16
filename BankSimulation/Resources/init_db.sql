CREATE TABLE "client" (
                          "client_id" int PRIMARY KEY,
                          "address" varchar(512),
                          "birthday" date,
                          "full_name" varchar(128),
                          "is_active" bit,
                          "id_credentials" int,
                          "id_personal_manager" int
);

CREATE TABLE "personal_manager" (
                                    "personal_manager_id" int PRIMARY KEY,
                                    "full_name" varchar(128),
                                    "is_active" bit,
                                    "id_credentials" int,
                                    "id_office" int
);

CREATE TABLE "admin" (
                         "admin_id" int PRIMARY KEY,
                         "full_name" varchar(128),
                         "id_credentials" int
);

CREATE TABLE "credentials" (
                               "credentials_id" int PRIMARY KEY,
                               "login" varchar(20),
                               "password" varchar(20)
);

CREATE TABLE "passport" (
                            "passport_id" int PRIMARY KEY,
                            "client_id" int,
                            "issued_at" date,
                            "issued_by" varchar(256),
                            "series" int,
                            "number" int,
                            "is_validated" bit
);

CREATE TABLE "passport_validation_result" (
                                              "id_passport_validation_result" int PRIMARY KEY,
                                              "id_passport" int,
                                              "message" varchar(512)
);

CREATE TABLE "account" (
                           "account_id" int PRIMARY KEY,
                           "client_id" int,
                           "name" varchar(64),
                           "description" varchar(128),
                           "account_currency" int,
                           "interest_rate" float,
                           "open_date" date,
                           "account_status" int,
                           "account_type" int
);

CREATE TABLE "account_status" (
                                  "account_status_id" int PRIMARY KEY,
                                  "status" varchar(64)
);

CREATE TABLE "account_type" (
                                "account_type_id" int PRIMARY KEY,
                                "name" varchar(64),
                                "description" varchar(128)
);

CREATE TABLE "currency" (
                            "currency_id" int PRIMARY KEY,
                            "name" varchar(64)
);

CREATE TABLE "application_type" (
                                    "application_type_id" int PRIMARY KEY,
                                    "name" varchar(64),
                                    "description" varchar(128),
                                    "website" varchar(128),
                                    "office_id" int
);

CREATE TABLE "office" (
                          "office_id" int PRIMARY KEY,
                          "region_id" int,
                          "address" varchar(64),
                          "description" varchar(128)
);

CREATE TABLE "region" (
                          "region_id" int PRIMARY KEY,
                          "city" varchar(64),
                          "region_name" varchar(64),
                          "country_name" varchar(64)
);

CREATE TABLE "application_type_to_client" (
                                              "client_id" int,
                                              "application_type_id" int
);

ALTER TABLE "client" ADD FOREIGN KEY ("id_credentials") REFERENCES "credentials" ("credentials_id");

ALTER TABLE "client" ADD FOREIGN KEY ("id_personal_manager") REFERENCES "personal_manager" ("personal_manager_id");

ALTER TABLE "personal_manager" ADD FOREIGN KEY ("id_credentials") REFERENCES "credentials" ("credentials_id");

ALTER TABLE "personal_manager" ADD FOREIGN KEY ("id_office") REFERENCES "office" ("office_id");

ALTER TABLE "admin" ADD FOREIGN KEY ("id_credentials") REFERENCES "credentials" ("credentials_id");

ALTER TABLE "passport" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("client_id");

ALTER TABLE "passport_validation_result" ADD FOREIGN KEY ("id_passport") REFERENCES "passport" ("passport_id");

ALTER TABLE "account" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("client_id");

ALTER TABLE "account" ADD FOREIGN KEY ("account_currency") REFERENCES "currency" ("currency_id");

ALTER TABLE "account" ADD FOREIGN KEY ("account_status") REFERENCES "account_status" ("account_status_id");

ALTER TABLE "account" ADD FOREIGN KEY ("account_type") REFERENCES "account_type" ("account_type_id");

ALTER TABLE "application_type" ADD FOREIGN KEY ("office_id") REFERENCES "office" ("office_id");

ALTER TABLE "office" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "application_type_to_client" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("client_id");

ALTER TABLE "application_type_to_client" ADD FOREIGN KEY ("application_type_id") REFERENCES "application_type" ("application_type_id");
