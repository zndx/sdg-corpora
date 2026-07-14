CREATE TABLE case_review_protocols (
  id INTEGER NOT NULL,
  protocol_identifier VARCHAR(32),
  protocol_name VARCHAR(32),
  version_number VARCHAR(32),
  review_date TIMESTAMP,
  status VARCHAR(32),
  scope_description VARCHAR(32),
  reviewer_name VARCHAR(32),
  system_domain_id INTEGER,
  expert_reviewer_id INTEGER,
  legal_case_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (system_domain_id) REFERENCES system_domains (id),
  FOREIGN KEY (expert_reviewer_id) REFERENCES expert_reviewers (id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (id)
);
