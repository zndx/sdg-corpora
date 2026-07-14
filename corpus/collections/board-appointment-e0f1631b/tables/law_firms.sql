CREATE TABLE law_firms (
  firm_id VARCHAR(44) NOT NULL,
  firm_name VARCHAR(32),
  founding_year INTEGER,
  primary_practice_areas VARCHAR(32),
  office_locations VARCHAR(32),
  legal_entity_status VARCHAR(32),
  person_id INTEGER,
  PRIMARY KEY (firm_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
