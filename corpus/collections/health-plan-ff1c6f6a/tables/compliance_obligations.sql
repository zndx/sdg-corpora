CREATE TABLE compliance_obligations (
  compliance_obligation_id INTEGER NOT NULL,
  obligation_identifier VARCHAR(32),
  description VARCHAR(32),
  compliance_deadline TIMESTAMP,
  status VARCHAR(32),
  applicable_year INTEGER,
  requires_amendment BOOLEAN,
  guidance_status VARCHAR(32),
  health_plan_id INTEGER,
  reporting_requirement_id INTEGER,
  PRIMARY KEY (compliance_obligation_id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id),
  FOREIGN KEY (reporting_requirement_id) REFERENCES reporting_requirements (reporting_requirement_id)
);
