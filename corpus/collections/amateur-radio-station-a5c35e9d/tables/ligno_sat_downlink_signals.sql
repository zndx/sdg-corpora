CREATE TABLE ligno_sat_downlink_signals (
  id INTEGER NOT NULL,
  downlink_id VARCHAR(32),
  timestamp TIMESTAMP,
  downlink_type VARCHAR(32),
  call_signs_included VARCHAR(32),
  message_count INTEGER,
  satellite_id VARCHAR(36),
  amateur_radio_station_id INTEGER,
  extracted_message_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (satellite_id) REFERENCES ligno_sats (satellite_id),
  FOREIGN KEY (amateur_radio_station_id) REFERENCES amateur_radio_stations (id),
  FOREIGN KEY (extracted_message_id) REFERENCES extracted_messages (id)
);
