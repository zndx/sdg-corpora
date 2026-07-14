CREATE TABLE locations_encounters (
  location_id INTEGER NOT NULL,
  encounter_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (location_id, encounter_id),
  FOREIGN KEY (location_id) REFERENCES locations (id),
  FOREIGN KEY (encounter_id) REFERENCES encounters (encounter_id)
);
