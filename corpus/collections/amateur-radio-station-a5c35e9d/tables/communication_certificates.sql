CREATE TABLE communication_certificates (
  certificate_id INTEGER NOT NULL,
  issue_date DATE,
  valid_until DATE,
  communication_type VARCHAR(32),
  status VARCHAR(32),
  amateur_radio_station_id INTEGER,
  signal_id INTEGER,
  PRIMARY KEY (certificate_id),
  FOREIGN KEY (amateur_radio_station_id) REFERENCES amateur_radio_stations (id),
  FOREIGN KEY (signal_id) REFERENCES ligno_sat_uplink_signals (signal_id)
);
