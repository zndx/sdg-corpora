CREATE TABLE system_domains (
  id INTEGER NOT NULL,
  domain_identifier VARCHAR(32),
  domain_name VARCHAR(32),
  responsible_agency VARCHAR(65),
  assessment_criteria VARCHAR(32),
  is_within_jurisdiction BOOLEAN,
  case_review_protocol_id INTEGER,
  government_agency_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (case_review_protocol_id) REFERENCES case_review_protocols (id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (government_agency_id)
);
