CREATE TABLE order_lines (
  id INTEGER NOT NULL,
  line_id VARCHAR(44),
  quantity INTEGER,
  unit_price VARCHAR(32),
  line_total DECIMAL,
  special_instructions VARCHAR(32),
  menu_item_id INTEGER,
  catering_order_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (menu_item_id),
  FOREIGN KEY (catering_order_id) REFERENCES catering_orders (catering_order_id)
);
