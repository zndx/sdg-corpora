CREATE TABLE corrective_action_plans (
  corrective_action_plan_id INTEGER NOT NULL,
  plan_id INTEGER,
  submission_date TIMESTAMP,
  compliance_deadline TIMESTAMP,
  status VARCHAR(32),
  corrective_steps_taken VARCHAR(32),
  preventive_measures VARCHAR(32),
  regulatory_violation_id INTEGER,
  licensee_id INTEGER,
  PRIMARY KEY (corrective_action_plan_id),
  FOREIGN KEY (regulatory_violation_id) REFERENCES regulatory_violations (regulatory_violation_id),
  FOREIGN KEY (licensee_id) REFERENCES licensees (id)
);
