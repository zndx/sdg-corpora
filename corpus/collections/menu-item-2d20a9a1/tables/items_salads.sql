CREATE TABLE items_salads (
  menu_item_id INTEGER NOT NULL,
  salad_id INTEGER NOT NULL,
  PRIMARY KEY (menu_item_id, salad_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id),
  FOREIGN KEY (salad_id) REFERENCES salads (id)
);
