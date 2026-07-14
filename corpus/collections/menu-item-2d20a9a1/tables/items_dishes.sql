CREATE TABLE items_dishes (
  menu_item_id INTEGER NOT NULL,
  side_dish_side_id VARCHAR(35) NOT NULL,
  PRIMARY KEY (menu_item_id, side_dish_side_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id),
  FOREIGN KEY (side_dish_side_id) REFERENCES side_dishes (side_id)
);
