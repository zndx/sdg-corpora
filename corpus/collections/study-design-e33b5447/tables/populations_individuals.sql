CREATE TABLE populations_individuals (
  population_id INTEGER NOT NULL,
  individual_participant_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (population_id, individual_participant_id),
  FOREIGN KEY (population_id) REFERENCES populations (population_id),
  FOREIGN KEY (individual_participant_id) REFERENCES individuals (participant_id)
);
