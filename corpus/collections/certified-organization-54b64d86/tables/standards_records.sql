CREATE TABLE standards_records (
  management_standard_id INTEGER NOT NULL,
  certification_record_id INTEGER NOT NULL,
  PRIMARY KEY (management_standard_id, certification_record_id),
  FOREIGN KEY (management_standard_id) REFERENCES management_standards (id),
  FOREIGN KEY (certification_record_id) REFERENCES certification_records (id)
);
