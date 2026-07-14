CREATE TABLE internal_communication_events (
  internal_communication_event_id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  timestamp TIMESTAMP,
  communication_direction VARCHAR(32),
  content_type VARCHAR(32),
  is_formal BOOLEAN,
  effectiveness_rating DECIMAL,
  social_media_platform_id INTEGER,
  employee_id VARCHAR(32),
  PRIMARY KEY (internal_communication_event_id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
