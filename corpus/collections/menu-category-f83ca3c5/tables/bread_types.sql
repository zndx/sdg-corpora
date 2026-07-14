CREATE TABLE bread_types (
  bread_type_id INTEGER NOT NULL,
  bread_code INTEGER,
  bread_name VARCHAR(32),
  is_house_made BOOLEAN,
  is_gluten_free BOOLEAN,
  is_vegan BOOLEAN,
  item_code VARCHAR(32),
  PRIMARY KEY (bread_type_id),
  FOREIGN KEY (item_code) REFERENCES menu_items (item_code)
);
