CREATE TABLE sauces_items (
  sauce_id INTEGER NOT NULL,
  menu_food_item_id INTEGER NOT NULL,
  PRIMARY KEY (sauce_id, menu_food_item_id),
  FOREIGN KEY (sauce_id) REFERENCES sauces (id),
  FOREIGN KEY (menu_food_item_id) REFERENCES menu_food_items (menu_food_item_id)
);
