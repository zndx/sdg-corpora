CREATE TABLE drink_variants (
  variant_id VARCHAR(32) NOT NULL,
  name VARCHAR(32),
  base_alcohol VARCHAR(32),
  price DECIMAL,
  alcohol_content DECIMAL,
  menu_item_id VARCHAR(32),
  PRIMARY KEY (variant_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id)
);
