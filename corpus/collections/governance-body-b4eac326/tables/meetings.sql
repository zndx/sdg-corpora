CREATE TABLE meetings (
  id INTEGER NOT NULL,
  meeting_identifier VARCHAR(32),
  meeting_type VARCHAR(32),
  scheduled_date TIMESTAMP,
  duration_hours DECIMAL,
  agenda_items INTEGER,
  meeting_status VARCHAR(32),
  governance_body_id INTEGER,
  business_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (governance_body_id) REFERENCES governance_bodies (id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (id)
);
