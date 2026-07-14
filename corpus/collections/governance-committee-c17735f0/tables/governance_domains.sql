CREATE TABLE governance_domains (
  governance_domain_id INTEGER NOT NULL,
  domain_name VARCHAR(32),
  domain_code INTEGER,
  regulatory_basis VARCHAR(32),
  is_mandatory BOOLEAN,
  governance_committee_id INTEGER,
  unit_i_d VARCHAR(32),
  PRIMARY KEY (governance_domain_id),
  FOREIGN KEY (governance_committee_id) REFERENCES governance_committees (id),
  FOREIGN KEY (unit_i_d) REFERENCES business_units (unit_i_d)
);
