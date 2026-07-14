CREATE TABLE interventions_variables (
  adaptation_intervention_id INTEGER NOT NULL,
  environmental_variable_id INTEGER NOT NULL,
  PRIMARY KEY (adaptation_intervention_id, environmental_variable_id),
  FOREIGN KEY (adaptation_intervention_id) REFERENCES adaptation_interventions (adaptation_intervention_id),
  FOREIGN KEY (environmental_variable_id) REFERENCES environmental_variables (environmental_variable_id)
);
