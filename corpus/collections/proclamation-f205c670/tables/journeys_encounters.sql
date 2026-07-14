CREATE TABLE journeys_encounters (
  journey_id INTEGER NOT NULL,
  encounter_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (journey_id, encounter_id),
  FOREIGN KEY (journey_id) REFERENCES journeys (journey_id),
  FOREIGN KEY (encounter_id) REFERENCES encounters (encounter_id)
);
