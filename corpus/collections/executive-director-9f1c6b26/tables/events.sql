CREATE TABLE events (
  event_id VARCHAR(44) NOT NULL,
  event_name VARCHAR(32),
  event_date TIMESTAMP,
  event_type VARCHAR(32),
  is_rental_show BOOLEAN,
  attendee_count INTEGER,
  revenue_generated DECIMAL,
  facility_id INTEGER,
  organization_id INTEGER,
  staff_member_staff_id INTEGER,
  program_id INTEGER,
  PRIMARY KEY (event_id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id)
);
