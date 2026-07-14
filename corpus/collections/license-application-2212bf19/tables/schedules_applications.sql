CREATE TABLE schedules_applications (
  fee_schedule_id INTEGER NOT NULL,
  license_application_id INTEGER NOT NULL,
  PRIMARY KEY (fee_schedule_id, license_application_id),
  FOREIGN KEY (fee_schedule_id) REFERENCES fee_schedules (id),
  FOREIGN KEY (license_application_id) REFERENCES license_applications (license_application_id)
);
