CREATE TABLE domain_names (
  domain_name_id INTEGER NOT NULL,
  domain_label VARCHAR(32),
  registration_date TIMESTAMP,
  expiration_date DATE,
  registrant_id INTEGER,
  status VARCHAR(32),
  is_privacy_protected BOOLEAN,
  top_level_domain_id INTEGER,
  PRIMARY KEY (domain_name_id),
  FOREIGN KEY (top_level_domain_id) REFERENCES top_level_domains (top_level_domain_id)
);
