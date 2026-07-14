CREATE TABLE students (
  student_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  grade_level INTEGER,
  school_enrollment VARCHAR(32),
  is_eligible_for_internet BOOLEAN,
  parent_guardian_contact VARCHAR(32),
  network_account_id INTEGER,
  acceptable_use_policy_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (network_account_id) REFERENCES network_accounts (id),
  FOREIGN KEY (acceptable_use_policy_id) REFERENCES acceptable_use_policies (id)
);
