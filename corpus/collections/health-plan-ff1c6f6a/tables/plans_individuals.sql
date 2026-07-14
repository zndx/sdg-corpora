CREATE TABLE plans_individuals (
  health_plan_id INTEGER NOT NULL,
  eligible_individual_id INTEGER NOT NULL,
  PRIMARY KEY (health_plan_id, eligible_individual_id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (id)
);
