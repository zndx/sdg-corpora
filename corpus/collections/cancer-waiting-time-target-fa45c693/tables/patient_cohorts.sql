CREATE TABLE patient_cohorts (
  patient_cohort_id INTEGER NOT NULL,
  age_threshold INTEGER,
  diagnosis_date DATE,
  referral_route VARCHAR(32),
  cohort_size INTEGER,
  cancer_type_id INTEGER,
  n_h_s_board_id INTEGER,
  PRIMARY KEY (patient_cohort_id),
  FOREIGN KEY (cancer_type_id) REFERENCES cancer_types (id),
  FOREIGN KEY (n_h_s_board_id) REFERENCES n_h_s_boards (id)
);
