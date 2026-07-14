CREATE TABLE care_recipients (
  id INTEGER NOT NULL,
  recipient_id VARCHAR(40),
  date_of_birth DATE,
  mental_capacity_status VARCHAR(32),
  primary_language VARCHAR(32),
  domiciliary_care_agency_id INTEGER,
  care_plan_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (domiciliary_care_agency_id) REFERENCES domiciliary_care_agencies (domiciliary_care_agency_id),
  FOREIGN KEY (care_plan_id) REFERENCES care_plans (id)
);
