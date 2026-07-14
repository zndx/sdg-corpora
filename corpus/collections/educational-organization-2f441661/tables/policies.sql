CREATE TABLE policies (
  policy_id INTEGER NOT NULL,
  policy_title VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  affects_draft_exemption BOOLEAN,
  government_body_id INTEGER,
  educational_program_id INTEGER,
  PRIMARY KEY (policy_id),
  FOREIGN KEY (government_body_id) REFERENCES government_bodies (id),
  FOREIGN KEY (educational_program_id) REFERENCES educational_programs (id)
);
