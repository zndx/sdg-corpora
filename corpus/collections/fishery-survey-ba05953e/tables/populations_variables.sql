CREATE TABLE populations_variables (
  fishermen_population_id INTEGER NOT NULL,
  environmental_variable_id INTEGER NOT NULL,
  PRIMARY KEY (fishermen_population_id, environmental_variable_id),
  FOREIGN KEY (fishermen_population_id) REFERENCES fishermen_populations (fishermen_population_id),
  FOREIGN KEY (environmental_variable_id) REFERENCES environmental_variables (environmental_variable_id)
);
