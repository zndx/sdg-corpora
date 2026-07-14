CREATE TABLE care_agencies (
  id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  agency_name VARCHAR(37),
  registered_address VARCHAR(32),
  contact_telephone VARCHAR(32),
  website_url VARCHAR(55),
  registration_status VARCHAR(32),
  last_inspection_date TIMESTAMP,
  inspection_event_id INTEGER,
  care_recipient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (inspection_event_id),
  FOREIGN KEY (care_recipient_id) REFERENCES care_recipients (care_recipient_id)
);
