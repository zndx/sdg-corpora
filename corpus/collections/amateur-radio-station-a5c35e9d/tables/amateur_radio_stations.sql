CREATE TABLE amateur_radio_stations (
  id INTEGER NOT NULL,
  call_sign VARCHAR(32),
  ssid INTEGER,
  location_qth VARCHAR(32),
  region_qra VARCHAR(32),
  status VARCHAR(32),
  signal_id INTEGER,
  certificate_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (signal_id) REFERENCES ligno_sat_uplink_signals (signal_id),
  FOREIGN KEY (certificate_id) REFERENCES communication_certificates (certificate_id)
);
