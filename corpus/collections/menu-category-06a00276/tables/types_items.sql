CREATE TABLE types_items (
  cheese_type_id INTEGER NOT NULL,
  food_item_id INTEGER NOT NULL,
  PRIMARY KEY (cheese_type_id, food_item_id),
  FOREIGN KEY (cheese_type_id) REFERENCES cheese_types (cheese_type_id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id)
);
