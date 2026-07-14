CREATE TABLE populations_designs (
  population_id INTEGER NOT NULL,
  study_design_id INTEGER NOT NULL,
  PRIMARY KEY (population_id, study_design_id),
  FOREIGN KEY (population_id) REFERENCES populations (population_id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id)
);
