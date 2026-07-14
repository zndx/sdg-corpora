CREATE TABLE agencies_facilities (
  funding_agency_id INTEGER NOT NULL,
  observatory_facility_id INTEGER NOT NULL,
  PRIMARY KEY (funding_agency_id, observatory_facility_id),
  FOREIGN KEY (funding_agency_id) REFERENCES funding_agencies (id),
  FOREIGN KEY (observatory_facility_id) REFERENCES observatory_facilities (id)
);
