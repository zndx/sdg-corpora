CREATE TABLE pizza_toppings (
  id INTEGER NOT NULL,
  topping_id VARCHAR(44),
  name VARCHAR(32),
  type VARCHAR(32),
  is_extra_cost BOOLEAN,
  extra_cost_amount DECIMAL,
  menu_item_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
