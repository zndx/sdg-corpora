CREATE TABLE legal_cases (
  id INTEGER NOT NULL,
  case_number VARCHAR(32),
  court_name VARCHAR(32),
  filing_date DATE,
  case_type VARCHAR(32),
  status VARCHAR(32),
  government_agency_id INTEGER,
  case_review_protocol_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (government_agency_id),
  FOREIGN KEY (case_review_protocol_id) REFERENCES case_review_protocols (id)
);
