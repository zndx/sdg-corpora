CREATE TABLE governance_committees (
  id INTEGER NOT NULL,
  committee_name VARCHAR(32),
  establishment_date DATE,
  primary_objective VARCHAR(32),
  is_cross_functional BOOLEAN,
  reporting_frequency VARCHAR(32),
  governance_domain_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (governance_domain_id) REFERENCES governance_domains (governance_domain_id)
);
