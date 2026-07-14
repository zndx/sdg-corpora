CREATE TABLE bread_types (
  id INTEGER NOT NULL,
  bread_id VARCHAR(44),
  name VARCHAR(32),
  is_house_made BOOLEAN,
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
