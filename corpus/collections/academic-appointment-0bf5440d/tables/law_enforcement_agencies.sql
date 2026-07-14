CREATE TABLE law_enforcement_agencies (
  law_enforcement_agency_id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  name VARCHAR(32),
  location_city VARCHAR(32),
  location_state VARCHAR(32),
  location_country VARCHAR(32),
  established_year INTEGER,
  person_id INTEGER,
  law_enforcement_division_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (law_enforcement_agency_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (law_enforcement_division_id) REFERENCES law_enforcement_divisions (id)
);
