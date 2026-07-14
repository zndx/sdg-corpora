CREATE TABLE quality_improvement_programs (
  quality_improvement_program_id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  methodology VARCHAR(32),
  target_population VARCHAR(32),
  first_responder_organization_id INTEGER,
  clinical_performance_data_id INTEGER,
  patient_outcome_id INTEGER,
  PRIMARY KEY (quality_improvement_program_id),
  FOREIGN KEY (first_responder_organization_id) REFERENCES first_responder_organizations (first_responder_organization_id),
  FOREIGN KEY (clinical_performance_data_id) REFERENCES clinical_performance_datas (clinical_performance_data_id),
  FOREIGN KEY (patient_outcome_id) REFERENCES patient_outcomes (id)
);
