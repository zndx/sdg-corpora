CREATE TABLE aid_recipients (
  id INTEGER NOT NULL,
  contact_name VARCHAR(32),
  cell_phone VARCHAR(32),
  physical_address VARCHAR(32),
  registration_deadline DATE,
  registration_status VARCHAR(32),
  aid_program_id INTEGER,
  notification_event_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (aid_program_id) REFERENCES aid_programs (id),
  FOREIGN KEY (notification_event_id) REFERENCES notification_events (id)
);
