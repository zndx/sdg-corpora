CREATE TABLE applications_records (
  recertification_application_id INTEGER NOT NULL,
  recertification_unit_record_id INTEGER NOT NULL,
  PRIMARY KEY (recertification_application_id, recertification_unit_record_id),
  FOREIGN KEY (recertification_application_id) REFERENCES recertification_applications (id),
  FOREIGN KEY (recertification_unit_record_id) REFERENCES recertification_unit_records (recertification_unit_record_id)
);
