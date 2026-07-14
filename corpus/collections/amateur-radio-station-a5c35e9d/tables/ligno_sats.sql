CREATE TABLE ligno_sats (
  satellite_id VARCHAR(36) NOT NULL,
  orbit_type VARCHAR(32),
  memory_capacity INTEGER,
  downlink_mode VARCHAR(32),
  status VARCHAR(32),
  signal_id INTEGER,
  ligno_sat_downlink_signal_id INTEGER,
  PRIMARY KEY (satellite_id),
  FOREIGN KEY (signal_id) REFERENCES ligno_sat_uplink_signals (signal_id),
  FOREIGN KEY (ligno_sat_downlink_signal_id) REFERENCES ligno_sat_downlink_signals (id)
);
