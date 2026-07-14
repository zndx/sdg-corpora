CREATE TABLE health_plans (
  id INTEGER NOT NULL,
  plan_identifier VARCHAR(32),
  plan_name VARCHAR(32),
  insurance_type VARCHAR(32),
  grandfathered_status VARCHAR(32),
  effective_date DATE,
  termination_date DATE,
  is_cafeteria_plan BOOLEAN,
  employer_size INTEGER,
  PRIMARY KEY (id)
);
