CREATE TABLE beverage_types (
  id INTEGER NOT NULL,
  beverage_id INTEGER,
  name VARCHAR(32),
  type VARCHAR(32),
  serving_temp VARCHAR(32),
  caffeinated BOOLEAN,
  menu_option_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_option_id) REFERENCES menu_options (menu_option_id)
);
