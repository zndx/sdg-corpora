CREATE TABLE care_staffs (
  care_staff_id INTEGER NOT NULL,
  staff_id INTEGER,
  security_clearance_status VARCHAR(32),
  training_completion_date DATE,
  employment_status VARCHAR(32),
  domiciliary_care_agency_id INTEGER,
  PRIMARY KEY (care_staff_id),
  FOREIGN KEY (domiciliary_care_agency_id) REFERENCES domiciliary_care_agencies (domiciliary_care_agency_id)
);
