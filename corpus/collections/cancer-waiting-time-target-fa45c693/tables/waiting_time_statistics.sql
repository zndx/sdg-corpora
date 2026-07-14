CREATE TABLE waiting_time_statistics (
  waiting_time_statistic_id INTEGER NOT NULL,
  reporting_period DATE,
  compliance_percentage DECIMAL,
  eligible_patient_count INTEGER,
  treatment_start_count INTEGER,
  percentile90 DECIMAL,
  data_quality VARCHAR(32),
  cancer_waiting_time_target_id INTEGER,
  n_h_s_board_id INTEGER,
  cancer_type_id INTEGER,
  PRIMARY KEY (waiting_time_statistic_id),
  FOREIGN KEY (cancer_waiting_time_target_id) REFERENCES cancer_waiting_time_targets (id),
  FOREIGN KEY (n_h_s_board_id) REFERENCES n_h_s_boards (id),
  FOREIGN KEY (cancer_type_id) REFERENCES cancer_types (id)
);
