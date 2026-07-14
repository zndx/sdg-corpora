CREATE TABLE workers (
  worker_id INTEGER NOT NULL,
  role VARCHAR(32),
  department VARCHAR(32),
  safety_training_status VARCHAR(32),
  certification_expiry DATE,
  workplace_activity_id INTEGER,
  reports_to_worker_id INTEGER,
  harassment_policy_id INTEGER,
  PRIMARY KEY (worker_id),
  FOREIGN KEY (workplace_activity_id) REFERENCES workplace_activities (id),
  FOREIGN KEY (reports_to_worker_id) REFERENCES workers (worker_id),
  FOREIGN KEY (harassment_policy_id) REFERENCES harassment_policies (id)
);
