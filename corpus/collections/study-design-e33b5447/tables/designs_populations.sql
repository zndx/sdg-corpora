CREATE TABLE designs_populations (
  study_design_id INTEGER NOT NULL,
  population_id INTEGER NOT NULL,
  PRIMARY KEY (study_design_id, population_id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id),
  FOREIGN KEY (population_id) REFERENCES populations (population_id)
);
