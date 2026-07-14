CREATE TABLE authorities_requirements (
  regulatory_authority_id INTEGER NOT NULL,
  requirement_id VARCHAR(38) NOT NULL,
  PRIMARY KEY (regulatory_authority_id, requirement_id),
  FOREIGN KEY (regulatory_authority_id) REFERENCES regulatory_authorities (id),
  FOREIGN KEY (requirement_id) REFERENCES compliance_requirements (requirement_id)
);
