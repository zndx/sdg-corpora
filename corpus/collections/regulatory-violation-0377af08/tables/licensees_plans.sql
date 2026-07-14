CREATE TABLE licensees_plans (
  licensee_id INTEGER NOT NULL,
  corrective_action_plan_id INTEGER NOT NULL,
  PRIMARY KEY (licensee_id, corrective_action_plan_id),
  FOREIGN KEY (licensee_id) REFERENCES licensees (id),
  FOREIGN KEY (corrective_action_plan_id) REFERENCES corrective_action_plans (corrective_action_plan_id)
);
