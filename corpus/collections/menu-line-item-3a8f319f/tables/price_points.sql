CREATE TABLE price_points (
  price_point_id INTEGER NOT NULL,
  price_id VARCHAR(44),
  amount DECIMAL,
  currency_code VARCHAR(44),
  price_type VARCHAR(32),
  menu_line_item_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (price_point_id),
  FOREIGN KEY (menu_line_item_id) REFERENCES menu_line_items (menu_line_item_id)
);
