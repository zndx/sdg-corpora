CREATE TABLE violence_policies (
  id INTEGER NOT NULL,
  policy_identifier VARCHAR(32),
  effective_date DATE,
  issuing_authority VARCHAR(32),
  compliance_standard VARCHAR(32),
  policy_status VARCHAR(32),
  worker_id INTEGER,
  safety_incident_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (worker_id) REFERENCES workers (worker_id),
  FOREIGN KEY (safety_incident_id) REFERENCES safety_incidents (id)
);
