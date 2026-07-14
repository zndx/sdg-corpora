CREATE TABLE dishes_items (
  side_dish_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (side_dish_id, menu_item_id),
  FOREIGN KEY (side_dish_id) REFERENCES side_dishes (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
