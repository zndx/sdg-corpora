CREATE TABLE stationery_items (
  code VARCHAR(34) NOT NULL,
  description VARCHAR(32),
  unit_price VARCHAR(32),
  required_quantity INTEGER,
  is_compulsory BOOLEAN,
  color VARCHAR(32),
  grade_level_id INTEGER,
  subject_id INTEGER,
  PRIMARY KEY (code),
  FOREIGN KEY (grade_level_id) REFERENCES grade_levels (id),
  FOREIGN KEY (subject_id) REFERENCES subjects (id)
);
