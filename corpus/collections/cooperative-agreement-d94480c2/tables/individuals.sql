CREATE TABLE individuals (
  individual_id INTEGER NOT NULL,
  individual_identifier VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  role VARCHAR(35),
  needs_complex_communication BOOLEAN,
  organization_id INTEGER,
  assistive_technology_id INTEGER,
  PRIMARY KEY (individual_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (assistive_technology_id) REFERENCES assistive_technologies (assistive_technology_id)
);
