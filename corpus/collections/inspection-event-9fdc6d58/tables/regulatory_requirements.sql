CREATE TABLE regulatory_requirements (
  id INTEGER NOT NULL,
  requirement_id VARCHAR(38),
  requirement_category VARCHAR(32),
  requirement_description VARCHAR(32),
  legal_basis VARCHAR(32),
  compliance_status VARCHAR(32),
  clinical_service_id INTEGER,
  finding_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (id),
  FOREIGN KEY (finding_id) REFERENCES regulatory_findings (finding_id)
);
