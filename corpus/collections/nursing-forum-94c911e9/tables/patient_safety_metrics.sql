CREATE TABLE patient_safety_metrics (
  patient_safety_metric_id INTEGER NOT NULL,
  metric_identifier VARCHAR(32),
  metric_name VARCHAR(32),
  baseline_value DECIMAL,
  current_value DECIMAL,
  target_value DECIMAL,
  measurement_date DATE,
  n_h_s_foundation_trust_id INTEGER,
  nursing_workstream_id INTEGER,
  nursing_leader_id INTEGER,
  PRIMARY KEY (patient_safety_metric_id),
  FOREIGN KEY (n_h_s_foundation_trust_id) REFERENCES n_h_s_foundation_trusts (id),
  FOREIGN KEY (nursing_workstream_id) REFERENCES nursing_workstreams (id),
  FOREIGN KEY (nursing_leader_id) REFERENCES nursing_leaders (nursing_leader_id)
);
