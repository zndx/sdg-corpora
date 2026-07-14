CREATE TABLE user_devices (
  id INTEGER NOT NULL,
  device_id INTEGER,
  device_type VARCHAR(32),
  operating_system VARCHAR(32),
  browser_version VARCHAR(32),
  data_subject_id INTEGER,
  cookie_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_subject_id) REFERENCES data_subjects (id),
  FOREIGN KEY (cookie_id) REFERENCES cookies (cookie_id)
);
