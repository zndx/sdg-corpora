CREATE TABLE ligno_sat_uplink_signals (
  signal_id INTEGER NOT NULL,
  timestamp TIMESTAMP,
  frequency DECIMAL,
  protocol_version VARCHAR(32),
  message_content VARCHAR(32),
  amateur_radio_station_id INTEGER,
  satellite_id VARCHAR(36),
  extracted_message_id INTEGER,
  PRIMARY KEY (signal_id),
  FOREIGN KEY (amateur_radio_station_id) REFERENCES amateur_radio_stations (id),
  FOREIGN KEY (satellite_id) REFERENCES ligno_sats (satellite_id),
  FOREIGN KEY (extracted_message_id) REFERENCES extracted_messages (id)
);
