CREATE TABLE extracted_messages (
  id INTEGER NOT NULL,
  message_id VARCHAR(35),
  message_type VARCHAR(32),
  content VARCHAR(32),
  extraction_timestamp TIMESTAMP,
  storage_status VARCHAR(32),
  signal_id INTEGER,
  satellite_id VARCHAR(36),
  ligno_sat_downlink_signal_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (signal_id) REFERENCES ligno_sat_uplink_signals (signal_id),
  FOREIGN KEY (satellite_id) REFERENCES ligno_sats (satellite_id),
  FOREIGN KEY (ligno_sat_downlink_signal_id) REFERENCES ligno_sat_downlink_signals (id)
);
