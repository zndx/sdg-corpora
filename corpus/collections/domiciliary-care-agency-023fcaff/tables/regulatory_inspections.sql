CREATE TABLE regulatory_inspections (
  regulatory_inspection_id INTEGER NOT NULL,
  inspection_id VARCHAR(32),
  inspection_date TIMESTAMP,
  publication_date DATE,
  notice_period INTEGER,
  inspection_type VARCHAR(32),
  overall_compliance_status VARCHAR(32),
  domiciliary_care_agency_id INTEGER,
  service_rating_id INTEGER,
  PRIMARY KEY (regulatory_inspection_id),
  FOREIGN KEY (domiciliary_care_agency_id) REFERENCES domiciliary_care_agencies (domiciliary_care_agency_id),
  FOREIGN KEY (service_rating_id) REFERENCES service_ratings (service_rating_id)
);
