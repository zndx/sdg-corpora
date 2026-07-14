CREATE TABLE protocols_sessions (
  ozone_therapy_protocol_id INTEGER NOT NULL,
  ozone_therapy_session_id INTEGER NOT NULL,
  PRIMARY KEY (ozone_therapy_protocol_id, ozone_therapy_session_id),
  FOREIGN KEY (ozone_therapy_protocol_id) REFERENCES ozone_therapy_protocols (ozone_therapy_protocol_id),
  FOREIGN KEY (ozone_therapy_session_id) REFERENCES ozone_therapy_sessions (id)
);
