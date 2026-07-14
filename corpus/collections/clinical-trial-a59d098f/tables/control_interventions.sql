CREATE TABLE control_interventions (
  control_intervention_id INTEGER NOT NULL,
  name VARCHAR(32),
  dosage DECIMAL,
  unit VARCHAR(32),
  control_group_id VARCHAR(32),
  PRIMARY KEY (control_intervention_id),
  FOREIGN KEY (control_group_id) REFERENCES control_groups (control_group_id)
);
