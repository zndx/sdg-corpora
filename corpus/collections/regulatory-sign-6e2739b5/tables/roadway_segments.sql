CREATE TABLE roadway_segments (
  roadway_segment_id INTEGER NOT NULL,
  segment_identifier VARCHAR(32),
  road_name VARCHAR(32),
  start_mile_marker DECIMAL,
  end_mile_marker DECIMAL,
  surface_type VARCHAR(32),
  lane_count INTEGER,
  speed_limit INTEGER,
  regulatory_sign_id INTEGER,
  traffic_regulation_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (roadway_segment_id),
  FOREIGN KEY (regulatory_sign_id) REFERENCES regulatory_signs (id),
  FOREIGN KEY (traffic_regulation_id) REFERENCES traffic_regulations (id)
);
