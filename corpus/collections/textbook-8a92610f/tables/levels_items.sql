CREATE TABLE levels_items (
  grade_level_id INTEGER NOT NULL,
  stationery_item_code VARCHAR(34) NOT NULL,
  PRIMARY KEY (grade_level_id, stationery_item_code),
  FOREIGN KEY (grade_level_id) REFERENCES grade_levels (id),
  FOREIGN KEY (stationery_item_code) REFERENCES stationery_items (code)
);
