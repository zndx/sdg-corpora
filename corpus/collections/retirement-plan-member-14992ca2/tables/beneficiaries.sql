CREATE TABLE beneficiaries (
  id INTEGER NOT NULL,
  beneficiary_id INTEGER,
  full_name VARCHAR(36),
  relationship VARCHAR(32),
  ssn VARCHAR(32),
  date_of_birth DATE,
  address VARCHAR(32),
  telephone VARCHAR(32),
  email_address VARCHAR(32),
  beneficiary_type VARCHAR(32),
  member_id INTEGER,
  benefit_option_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (member_id) REFERENCES retirement_plan_members (member_id),
  FOREIGN KEY (benefit_option_id) REFERENCES benefit_options (id)
);
