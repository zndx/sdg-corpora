CREATE TABLE h_c_a_h_p_s_metrics (
  h_c_a_h_p_s_metric_id INTEGER NOT NULL,
  metric_id VARCHAR(44),
  survey_date DATE,
  category VARCHAR(32),
  score DECIMAL,
  benchmark DECIMAL,
  trend VARCHAR(32),
  patient_id VARCHAR(32),
  medication_fact_sheet_id INTEGER,
  PRIMARY KEY (h_c_a_h_p_s_metric_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (medication_fact_sheet_id) REFERENCES medication_fact_sheets (id)
);
