CREATE TABLE awards (
  award_id INTEGER NOT NULL,
  award_name VARCHAR(32),
  award_year INTEGER,
  award_description VARCHAR(32),
  award_status VARCHAR(32),
  person_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (award_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
