CREATE TABLE positions (
  id INTEGER NOT NULL,
  position_id VARCHAR(44),
  position_title VARCHAR(32),
  start_date DATE,
  end_date DATE,
  responsibilities VARCHAR(32),
  person_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
