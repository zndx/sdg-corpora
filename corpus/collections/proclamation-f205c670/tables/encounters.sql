CREATE TABLE encounters (
  encounter_id VARCHAR(44) NOT NULL,
  location VARCHAR(32),
  date_time TIMESTAMP,
  outcome VARCHAR(32),
  advice_given VARCHAR(32),
  participant_role VARCHAR(32),
  eligible_individual_id INTEGER,
  location_id INTEGER,
  PRIMARY KEY (encounter_id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (eligible_individual_id),
  FOREIGN KEY (location_id) REFERENCES locations (id)
);
