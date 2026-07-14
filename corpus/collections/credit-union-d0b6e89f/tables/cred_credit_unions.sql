CREATE TABLE cred_credit_unions (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  legal_name VARCHAR(32),
  founding_date DATE,
  headquarters_city VARCHAR(32),
  headquarters_state VARCHAR(32),
  member_eligibility_criteria VARCHAR(32),
  regulatory_status VARCHAR(32),
  executive_role_id INTEGER,
  award_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_role_id) REFERENCES cred_executive_roles (executive_role_id),
  FOREIGN KEY (award_id) REFERENCES cred_awards (id)
);
