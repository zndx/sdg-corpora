CREATE TABLE component_parts (
  id INTEGER NOT NULL,
  part_number VARCHAR(32),
  base_part_number VARCHAR(32),
  suffix VARCHAR(32),
  case_style VARCHAR(32),
  marking_style VARCHAR(32),
  is_ro_hs_compliant BOOLEAN,
  is_high_reliability BOOLEAN,
  screening_standard VARCHAR(32),
  electrical_specification_id INTEGER,
  mechanical_specification_id INTEGER,
  electrical_rating_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (electrical_specification_id) REFERENCES electrical_specifications (electrical_specification_id),
  FOREIGN KEY (mechanical_specification_id) REFERENCES mechanical_specifications (id),
  FOREIGN KEY (electrical_rating_id) REFERENCES electrical_ratings (electrical_rating_id)
);
