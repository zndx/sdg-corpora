CREATE TABLE types_items (
  order_type_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (order_type_id, menu_item_id),
  FOREIGN KEY (order_type_id) REFERENCES order_types (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
