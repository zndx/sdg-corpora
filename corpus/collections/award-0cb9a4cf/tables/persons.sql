CREATE TABLE persons (
  person_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  degree VARCHAR(32),
  certification VARCHAR(32),
  birth_date DATE,
  position_id INTEGER,
  award_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (position_id) REFERENCES positions (id),
  FOREIGN KEY (award_id) REFERENCES awards (award_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
