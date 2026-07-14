CREATE TABLE menu_items (
  id INTEGER NOT NULL,
  item_id VARCHAR(32),
  name VARCHAR(32),
  category VARCHAR(32),
  price DECIMAL,
  description VARCHAR(32),
  is_gluten_free BOOLEAN,
  is_baked BOOLEAN,
  is_breaded BOOLEAN,
  is_grilled BOOLEAN,
  is_fried BOOLEAN,
  is_pan_seared BOOLEAN,
  PRIMARY KEY (id)
);
