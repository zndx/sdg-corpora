CREATE TABLE committees_domains (
  legislative_committee_id INTEGER NOT NULL,
  domain_code INTEGER NOT NULL,
  PRIMARY KEY (legislative_committee_id, domain_code),
  FOREIGN KEY (legislative_committee_id) REFERENCES legislative_committees (id),
  FOREIGN KEY (domain_code) REFERENCES policy_domains (domain_code)
);
