-- credentials
CREATE TABLE credentials
(
    credentials_id serial
        primary key
        unique,
    login          varchar(20) not null,
    password       varchar(20) not null
);

-- office and region
CREATE TABLE regions
(
    region_id   serial
        primary key
        unique,
    region_name varchar(64) not null
);

CREATE TABLE cities
(
    city_id     serial
        primary key
        unique,
    region      int         not null,
    name        varchar(64) not null,
    description varchar(128)
);

CREATE TABLE offices
(
    office_id   serial
        primary key
        unique,
    city_id     int         not null,
    address     varchar(64) not null,
    description varchar(128)
);

-- roles
CREATE TABLE admin
(
    admin_id    serial
        primary key
        unique,
    full_name   varchar(128) not null,
    credentials int          not null
);

CREATE TABLE personal_managers
(
    personal_manager_id serial
        primary key
        unique,
    full_name           varchar(128) not null,
    is_active           boolean      not null,
    credentials         int          not null,
    office              int          not null
);

CREATE TABLE clients
(
    client_id        serial
        primary key
        unique,
    address          varchar(256) not null,
    birthday         date         not null,
    full_name        varchar(128) not null,
    is_active        boolean      not null,
    passport         int          not null,
    credentials      int          not null,
    personal_manager int          not null
);

CREATE TABLE passports
(
    passport_id  serial
        primary key
        unique,
    issued_at    date         not null,
    issued_by    varchar(256) not null,
    series       int          not null,
    number       int          not null,
    is_validated boolean      not null
);

-- account
CREATE TYPE account_status AS ENUM (
    'Active',
    'On validation',
    'Frozen',
    'Inactive'
    );

CREATE TYPE account_type as ENUM (
    'Regular',
    'Deposit',
    'Charity');

CREATE TYPE currency as ENUM (
    'Russian ruble',
    'US Dollar',
    'Euro',
    'Swiss frank'
    );

CREATE TABLE accounts
(
    account_id    serial
        primary key
        unique,
    client_id     int            not null,
    name          varchar(64)    not null,
    balance       float          not null,
    currency      currency       not null,
    interest_rate float          not null,
    open_date     date           not null,
    status        account_status not null,
    type          account_type   not null
);

-- application
CREATE TYPE application_type as ENUM (
    'Online',
    'In office'
    );

CREATE TYPE application_result as ENUM (
    'Confirmed',
    'In progress',
    'Not started yet',
    'Declined'
    );

CREATE TABLE applications
(
    application_id   serial
        primary key
        unique,
    client           int                not null,
    personal_manager int                not null,
    application_date date               not null,
    type             application_type   not null,
    result           application_result not null,
    description      varchar(128)
);

-- transactions
CREATE TYPE transaction_type as ENUM
    (
        'Inter-client accounts',
        'Inter-clients',
        'Charity'
        );

CREATE TYPE transaction_status as ENUM
    (
        'Confirmed',
        'In progress',
        'Declined'
        );

CREATE TABLE transactions
(
    transaction_id   serial
        primary key
        unique,
    sender_account   int                not null,
    receiver_account int                not null,
    date             date               not null,
    amount           float              not null,
    type             transaction_type   not null,
    status           transaction_status not null,
    description      varchar(128)
);

-- references
ALTER TABLE clients
    ADD FOREIGN KEY (passport) REFERENCES passports (passport_id);

ALTER TABLE clients
    ADD FOREIGN KEY (credentials) REFERENCES credentials (credentials_id);

ALTER TABLE clients
    ADD FOREIGN KEY (personal_manager) REFERENCES personal_managers (personal_manager_id);

ALTER TABLE personal_managers
    ADD FOREIGN KEY (credentials) REFERENCES credentials (credentials_id);

ALTER TABLE personal_managers
    ADD FOREIGN KEY (office) REFERENCES offices (office_id);

ALTER TABLE admin
    ADD FOREIGN KEY (credentials) REFERENCES credentials (credentials_id);

ALTER TABLE accounts
    ADD FOREIGN KEY (client_id) REFERENCES clients (client_id);

ALTER TABLE offices
    ADD FOREIGN KEY (city_id) REFERENCES cities (city_id);

ALTER TABLE cities
    ADD FOREIGN KEY (region) REFERENCES regions (region_id);

ALTER TABLE applications
    ADD FOREIGN KEY (client) REFERENCES clients (client_id);

ALTER TABLE applications
    ADD FOREIGN KEY (personal_manager) REFERENCES personal_managers (personal_manager_id);

ALTER TABLE transactions
    ADD FOREIGN KEY (sender_account) REFERENCES accounts (account_id);

ALTER TABLE transactions
    ADD FOREIGN KEY (receiver_account) REFERENCES accounts (account_id);
