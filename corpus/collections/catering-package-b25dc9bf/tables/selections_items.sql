CREATE TABLE selections_items (
  beverage_selection_id INTEGER NOT NULL,
  food_beverage_item_id INTEGER NOT NULL,
  PRIMARY KEY (beverage_selection_id, food_beverage_item_id),
  FOREIGN KEY (beverage_selection_id) REFERENCES beverage_selections (id),
  FOREIGN KEY (food_beverage_item_id) REFERENCES food_beverage_items (food_beverage_item_id)
);
