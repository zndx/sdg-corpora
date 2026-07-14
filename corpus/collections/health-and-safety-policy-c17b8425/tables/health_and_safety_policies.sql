CREATE TABLE health_and_safety_policies (
  id INTEGER NOT NULL,
  policy_identifier VARCHAR(32),
  effective_date DATE,
  issuing_authority VARCHAR(32),
  compliance_standard VARCHAR(32),
  policy_status VARCHAR(32),
  workplace_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (workplace_activity_id) REFERENCES workplace_activities (id)
);
