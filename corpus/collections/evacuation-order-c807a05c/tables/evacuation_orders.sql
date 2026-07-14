CREATE TABLE evacuation_orders (
  id INTEGER NOT NULL,
  order_identifier VARCHAR(32),
  issuing_authority VARCHAR(32),
  issue_date_time TIMESTAMP,
  evacuation_type VARCHAR(32),
  warning_method VARCHAR(32),
  compliance_status VARCHAR(32),
  hazard_event_id INTEGER,
  warning_channel_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hazard_event_id) REFERENCES hazard_events (hazard_event_id),
  FOREIGN KEY (warning_channel_id) REFERENCES warning_channels (warning_channel_id)
);
