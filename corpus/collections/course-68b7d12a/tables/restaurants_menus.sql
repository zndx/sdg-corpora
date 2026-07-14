CREATE TABLE restaurants_menus (
  restaurant_id INTEGER NOT NULL,
  fixed_price_menu_id INTEGER NOT NULL,
  PRIMARY KEY (restaurant_id, fixed_price_menu_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id),
  FOREIGN KEY (fixed_price_menu_id) REFERENCES fixed_price_menus (id)
);
