CREATE TABLE food_ingredients (
  id INTEGER NOT NULL,
  ingredient_id VARCHAR(42),
  name VARCHAR(32),
  origin VARCHAR(32),
  allergen_flag BOOLEAN,
  is_local_sourced BOOLEAN,
  storage_temp DECIMAL,
  menu_option_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_option_id) REFERENCES menu_options (menu_option_id)
);
