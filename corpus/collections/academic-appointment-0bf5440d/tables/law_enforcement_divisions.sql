CREATE TABLE law_enforcement_divisions (
  id INTEGER NOT NULL,
  division_id VARCHAR(32),
  name VARCHAR(32),
  parent_agency_id VARCHAR(37),
  established_date DATE,
  law_enforcement_agency_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (law_enforcement_agency_id) REFERENCES law_enforcement_agencies (law_enforcement_agency_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
