CREATE TABLE rangers (
    ranger_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR ( 255 ) NOT NULL,
    region VARCHAR ( 255 ) NOT NULL
);

CREATE TABLE species (
    species_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    common_name VARCHAR( 255 ) NOT NULL,
    scientific_name VARCHAR ( 255 ) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR( 55 ) CHECK ( conservation_status IN ('Endangered', 'Vulnerable') )
);

ALTER TABLE species
DROP CONSTRAINT species_conservation_status_check;

CREATE TABLE sightings (
    sighting_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR( 255 ),
    notes TEXT
);


INSERT INTO rangers (name, region)
VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


-- Task One:
INSERT INTO rangers (name, region)
VALUES ('Darek Fox', 'Coastal Plains');


-- Task Two: Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;


-- Task Three: Find all sightings where the location includes "Pass"
SELECT * FROM sightings
WHERE location LIKE '%Pass%';

-- Task Four: List each ranger's name and their total number of sightings.
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers AS r
JOIN sightings AS s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

-- Task five: List species that have never been sighted.
SELECT s.common_name
FROM species AS s
LEFT JOIN sightings AS si ON s.species_id = si.species_id
WHERE si.species_id IS NULL;

-- Task six: Show the most recent 2 sightings.
SELECT sp.common_name, si.sighting_time, r.name
FROM sightings AS si
JOIN species AS sp ON si.species_id = sp.species_id
JOIN rangers AS r ON si.ranger_id = r.ranger_id
ORDER BY si.sighting_time DESC LIMIT 2;

-- Task seven: Update all species discovered before year 1800 to have status 'Historic'
UPDATE species 
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';



-- Task nine:  Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT ranger_id
    FROM sightings
);