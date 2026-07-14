CREATE TABLE individuals_populations (
  individual_participant_id VARCHAR(44) NOT NULL,
  population_id INTEGER NOT NULL,
  PRIMARY KEY (individual_participant_id, population_id),
  FOREIGN KEY (individual_participant_id) REFERENCES individuals (participant_id),
  FOREIGN KEY (population_id) REFERENCES populations (population_id)
);
