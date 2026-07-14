CREATE TABLE patterns_carpets (
  design_pattern_id INTEGER NOT NULL,
  carpet_id INTEGER NOT NULL,
  PRIMARY KEY (design_pattern_id, carpet_id),
  FOREIGN KEY (design_pattern_id) REFERENCES design_patterns (design_pattern_id),
  FOREIGN KEY (carpet_id) REFERENCES carpets (id)
);
