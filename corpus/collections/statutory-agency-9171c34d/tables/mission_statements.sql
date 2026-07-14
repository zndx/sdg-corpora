CREATE TABLE mission_statements (
  id INTEGER NOT NULL,
  mission_id VARCHAR(44),
  mission_text VARCHAR(32),
  is_subset_of VARCHAR(32),
  requires_specialized_expertise BOOLEAN,
  funding_mechanism VARCHAR(32),
  statutory_agency_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (statutory_agency_id) REFERENCES statutory_agencies (id)
);
