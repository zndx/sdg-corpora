CREATE TABLE policy_domains (
  domain_code INTEGER NOT NULL,
  domain_name VARCHAR(32),
  regulatory_scope VARCHAR(32),
  enforcement_agency VARCHAR(47),
  legislative_committee_id INTEGER,
  overlaps_with_domain_code INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (domain_code),
  FOREIGN KEY (legislative_committee_id) REFERENCES legislative_committees (id),
  FOREIGN KEY (overlaps_with_domain_code) REFERENCES policy_domains (domain_code)
);
