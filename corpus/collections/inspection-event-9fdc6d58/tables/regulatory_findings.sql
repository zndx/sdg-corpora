CREATE TABLE regulatory_findings (
  finding_id VARCHAR(44) NOT NULL,
  finding_category VARCHAR(32),
  finding_status VARCHAR(32),
  finding_description VARCHAR(32),
  finding_date TIMESTAMP,
  prior_finding_id VARCHAR(32),
  clinical_service_id INTEGER,
  inspection_event_id INTEGER,
  regulatory_requirement_id INTEGER,
  PRIMARY KEY (finding_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (inspection_event_id),
  FOREIGN KEY (regulatory_requirement_id) REFERENCES regulatory_requirements (id)
);
