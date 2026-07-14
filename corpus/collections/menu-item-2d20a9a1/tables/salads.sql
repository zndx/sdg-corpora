CREATE TABLE salads (
  id INTEGER NOT NULL,
  salad_id VARCHAR(32),
  name VARCHAR(32),
  base_greens VARCHAR(32),
  dressing VARCHAR(32),
  is_chef_special BOOLEAN,
  menu_item_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
