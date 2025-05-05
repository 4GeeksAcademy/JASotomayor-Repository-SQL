-- create.sql
-- Creates the necessary tables for the "Data Detectives" project (SQLite version)

DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS observations;
DROP TABLE IF EXISTS climate;

-- Regions table
CREATE TABLE regions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    country TEXT
);

-- Species table
CREATE TABLE species (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    scientific_name TEXT NOT NULL UNIQUE,
    common_name TEXT,
    genus TEXT,
    family TEXT,
    order_name TEXT
);

-- Observations table


-- Climate table (generic structure)
CREATE TABLE climate (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    region_id INTEGER,
    avg_temperature REAL,
    precipitation REAL,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);
