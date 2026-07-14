CREATE TABLE targets_types (
  cancer_waiting_time_target_id INTEGER NOT NULL,
  cancer_type_id INTEGER NOT NULL,
  PRIMARY KEY (cancer_waiting_time_target_id, cancer_type_id),
  FOREIGN KEY (cancer_waiting_time_target_id) REFERENCES cancer_waiting_time_targets (id),
  FOREIGN KEY (cancer_type_id) REFERENCES cancer_types (id)
);
