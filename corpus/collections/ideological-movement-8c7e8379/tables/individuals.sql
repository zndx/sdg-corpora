CREATE TABLE individuals (
  individual_id INTEGER NOT NULL,
  person_identifier VARCHAR(34),
  full_name VARCHAR(36),
  birth_country VARCHAR(32),
  current_residence VARCHAR(32),
  former_affiliation VARCHAR(32),
  current_stance VARCHAR(32),
  publications_count INTEGER,
  religious_organization_id INTEGER,
  geopolitical_region_id INTEGER,
  publication_id INTEGER,
  PRIMARY KEY (individual_id),
  FOREIGN KEY (religious_organization_id) REFERENCES religious_organizations (religious_organization_id),
  FOREIGN KEY (geopolitical_region_id) REFERENCES geopolitical_regions (id),
  FOREIGN KEY (publication_id) REFERENCES publications (publication_id)
);
