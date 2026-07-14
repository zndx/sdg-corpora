CREATE TABLE notification_events (
  id INTEGER NOT NULL,
  notification_type VARCHAR(32),
  scheduled_date DATE,
  delivery_status VARCHAR(32),
  aid_recipient_id INTEGER,
  aid_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (aid_recipient_id) REFERENCES aid_recipients (id),
  FOREIGN KEY (aid_program_id) REFERENCES aid_programs (id)
);
