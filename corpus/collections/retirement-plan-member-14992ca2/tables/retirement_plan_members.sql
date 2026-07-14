CREATE TABLE retirement_plan_members (
  member_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  ssn VARCHAR(32),
  date_of_birth DATE,
  gender VARCHAR(32),
  address VARCHAR(32),
  telephone VARCHAR(32),
  email_address VARCHAR(32),
  has_spouse_member_id INTEGER,
  participating_employer_id INTEGER,
  PRIMARY KEY (member_id),
  FOREIGN KEY (has_spouse_member_id) REFERENCES retirement_plan_members (member_id),
  FOREIGN KEY (participating_employer_id) REFERENCES participating_employers (id)
);
