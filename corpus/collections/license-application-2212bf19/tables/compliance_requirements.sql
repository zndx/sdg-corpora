CREATE TABLE compliance_requirements (
  requirement_id VARCHAR(38) NOT NULL,
  category VARCHAR(32),
  legal_reference VARCHAR(32),
  is_mandatory BOOLEAN,
  regulatory_authority_id INTEGER,
  PRIMARY KEY (requirement_id),
  FOREIGN KEY (regulatory_authority_id) REFERENCES regulatory_authorities (id)
);
