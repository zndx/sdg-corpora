CREATE TABLE traffic_regulations (
  id INTEGER NOT NULL,
  regulation_code VARCHAR(44),
  regulation_type VARCHAR(32),
  effective_date DATE,
  jurisdiction VARCHAR(32),
  penalty_amount VARCHAR(32),
  is_active BOOLEAN,
  regulatory_sign_id INTEGER,
  roadway_segment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regulatory_sign_id) REFERENCES regulatory_signs (id),
  FOREIGN KEY (roadway_segment_id) REFERENCES roadway_segments (roadway_segment_id)
);
