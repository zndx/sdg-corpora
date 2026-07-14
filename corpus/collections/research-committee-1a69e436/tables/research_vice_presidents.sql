CREATE TABLE research_vice_presidents (
  id INTEGER NOT NULL,
  official_name VARCHAR(32),
  title VARCHAR(32),
  appointment_date DATE,
  status VARCHAR(32),
  research_committee_id INTEGER,
  scientific_bureau_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_committee_id) REFERENCES research_committees (id),
  FOREIGN KEY (scientific_bureau_id) REFERENCES scientific_bureaus (id)
);
