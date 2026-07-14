CREATE TABLE national_diabetes_plans (
  id INTEGER NOT NULL,
  plan_identifier VARCHAR(32),
  jurisdiction_name VARCHAR(32),
  implementation_status VARCHAR(32),
  adoption_date DATE,
  policy_scope VARCHAR(32),
  responsible_agency VARCHAR(65),
  jurisdiction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id)
);
