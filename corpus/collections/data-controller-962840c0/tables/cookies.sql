CREATE TABLE cookies (
  cookie_id INTEGER NOT NULL,
  purpose VARCHAR(32),
  expiration_date DATE,
  is_essential BOOLEAN,
  third_party_provider VARCHAR(32),
  data_controller_id INTEGER,
  user_device_id INTEGER,
  PRIMARY KEY (cookie_id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id),
  FOREIGN KEY (user_device_id) REFERENCES user_devices (id)
);
