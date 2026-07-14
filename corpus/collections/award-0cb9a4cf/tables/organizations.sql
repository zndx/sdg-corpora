CREATE TABLE organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  founding_date DATE,
  headquarters_location VARCHAR(32),
  person_id INTEGER,
  award_id INTEGER,
  campus_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (award_id) REFERENCES awards (award_id),
  FOREIGN KEY (campus_id) REFERENCES campuses (campus_id)
);
