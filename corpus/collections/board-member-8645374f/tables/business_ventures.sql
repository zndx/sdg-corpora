CREATE TABLE business_ventures (
  id INTEGER NOT NULL,
  venture_id INTEGER,
  venture_name VARCHAR(32),
  industry_sector VARCHAR(32),
  operational_status VARCHAR(32),
  geographic_scope VARCHAR(32),
  organization_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
