CREATE TABLE design_patterns (
  design_pattern_id INTEGER NOT NULL,
  pattern_id VARCHAR(44),
  pattern_type VARCHAR(32),
  complexity_level INTEGER,
  cultural_origin VARCHAR(32),
  visual_impact VARCHAR(32),
  repetition_frequency INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (design_pattern_id)
);
