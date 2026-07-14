CREATE TABLE reporting_requirements (
  reporting_requirement_id INTEGER NOT NULL,
  requirement_identifier VARCHAR(32),
  report_type VARCHAR(34),
  effective_date DATE,
  is_voluntary BOOLEAN,
  applicable_entity_size VARCHAR(32),
  status VARCHAR(32),
  health_plan_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (reporting_requirement_id),
  FOREIGN KEY (health_plan_id) REFERENCES health_plans (id)
);
