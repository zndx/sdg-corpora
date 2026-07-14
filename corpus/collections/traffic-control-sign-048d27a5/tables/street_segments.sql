CREATE TABLE street_segments (
  id INTEGER NOT NULL,
  segment_id VARCHAR(44),
  street_name VARCHAR(32),
  lane_count INTEGER,
  is_one_way BOOLEAN,
  is_closed_for_repairs BOOLEAN,
  surface_type VARCHAR(32),
  traffic_control_sign_id INTEGER,
  rule_code VARCHAR(44),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (traffic_control_sign_id) REFERENCES traffic_control_signs (traffic_control_sign_id),
  FOREIGN KEY (rule_code) REFERENCES traffic_rules (rule_code)
);
