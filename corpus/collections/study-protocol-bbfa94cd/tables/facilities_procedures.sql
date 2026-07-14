CREATE TABLE facilities_procedures (
  imaging_facility_id INTEGER NOT NULL,
  imaging_procedure_id INTEGER NOT NULL,
  PRIMARY KEY (imaging_facility_id, imaging_procedure_id),
  FOREIGN KEY (imaging_facility_id) REFERENCES imaging_facilities (imaging_facility_id),
  FOREIGN KEY (imaging_procedure_id) REFERENCES imaging_procedures (id)
);
