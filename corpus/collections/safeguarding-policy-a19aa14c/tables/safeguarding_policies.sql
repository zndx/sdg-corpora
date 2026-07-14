CREATE TABLE safeguarding_policies (
  safeguarding_policy_id INTEGER NOT NULL,
  policy_identifier VARCHAR(32),
  effective_date DATE,
  issuing_authority VARCHAR(32),
  jurisdiction VARCHAR(32),
  compliance_standard VARCHAR(32),
  review_cycle VARCHAR(32),
  status VARCHAR(32),
  supersedes_safeguarding_policy_id INTEGER,
  student_id INTEGER,
  staff_member_staff_id INTEGER,
  PRIMARY KEY (safeguarding_policy_id),
  FOREIGN KEY (supersedes_safeguarding_policy_id) REFERENCES safeguarding_policies (safeguarding_policy_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
