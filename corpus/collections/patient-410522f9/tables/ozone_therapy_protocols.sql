CREATE TABLE ozone_therapy_protocols (
  ozone_therapy_protocol_id INTEGER NOT NULL,
  protocol_id INTEGER,
  total_sessions INTEGER,
  oxygen_ratio DECIMAL,
  administration_method VARCHAR(32),
  biochemical_adjustment BOOLEAN,
  PRIMARY KEY (ozone_therapy_protocol_id)
);
