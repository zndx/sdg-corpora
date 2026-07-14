CREATE TABLE care_recipients (
  care_recipient_id INTEGER NOT NULL,
  recipient_id VARCHAR(40),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  address VARCHAR(32),
  support_needs_assessment_date TIMESTAMP,
  dietary_preferences VARCHAR(32),
  mental_capacity_status VARCHAR(32),
  care_agency_id INTEGER,
  staff_assignment_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (care_recipient_id),
  FOREIGN KEY (care_agency_id) REFERENCES care_agencies (id),
  FOREIGN KEY (staff_assignment_id) REFERENCES staff_assignments (id)
);
