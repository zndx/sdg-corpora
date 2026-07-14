CREATE TABLE agencies_agencies (
  agency_id VARCHAR(39) NOT NULL,
  collaborates_with_agency_id VARCHAR(39) NOT NULL,
  PRIMARY KEY (agency_id, collaborates_with_agency_id),
  FOREIGN KEY (agency_id) REFERENCES service_agencies (agency_id),
  FOREIGN KEY (collaborates_with_agency_id) REFERENCES service_agencies (agency_id)
);
