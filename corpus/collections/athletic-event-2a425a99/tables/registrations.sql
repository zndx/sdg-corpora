CREATE TABLE registrations (
  registration_id INTEGER NOT NULL,
  registration_date TIMESTAMP,
  fee_amount DECIMAL,
  payment_status VARCHAR(32),
  roster_number VARCHAR(32),
  athletic_event_id INTEGER,
  participant_id INTEGER,
  PRIMARY KEY (registration_id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id),
  FOREIGN KEY (participant_id) REFERENCES participants (id)
);
