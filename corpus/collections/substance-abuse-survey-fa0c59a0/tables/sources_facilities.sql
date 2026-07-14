CREATE TABLE sources_facilities (
  funding_source_id INTEGER NOT NULL,
  treatment_facility_id INTEGER NOT NULL,
  PRIMARY KEY (funding_source_id, treatment_facility_id),
  FOREIGN KEY (funding_source_id) REFERENCES funding_sources (id),
  FOREIGN KEY (treatment_facility_id) REFERENCES treatment_facilities (id)
);
