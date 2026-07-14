CREATE TABLE schools (
  id INTEGER NOT NULL,
  school_id INTEGER,
  name VARCHAR(32),
  country_code VARCHAR(44),
  latitude DECIMAL,
  longitude DECIMAL,
  enrollment_count INTEGER,
  connectivity_status VARCHAR(32),
  device_id INTEGER,
  country_id INTEGER,
  connectivity_provider_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (device_id) REFERENCES educational_devices (device_id),
  FOREIGN KEY (country_id) REFERENCES countries (id),
  FOREIGN KEY (connectivity_provider_id) REFERENCES connectivity_providers (id)
);
