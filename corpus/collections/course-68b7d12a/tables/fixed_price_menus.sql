CREATE TABLE fixed_price_menus (
  id INTEGER NOT NULL,
  menu_name VARCHAR(32),
  price_per_person DECIMAL,
  tax_included BOOLEAN,
  gratuity_included BOOLEAN,
  valid_from TIMESTAMP,
  valid_until TIMESTAMP,
  restaurant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
);
