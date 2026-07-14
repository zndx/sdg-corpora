CREATE TABLE plans_obligations (
  health_plan_id INTEGER NOT NULL,
  compliance_obligation_id INTEGER NOT NULL,
  PRIMARY KEY (health_plan_id, compliance_obligation_id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id),
  FOREIGN KEY (compliance_obligation_id) REFERENCES compliance_obligations (compliance_obligation_id)
);
