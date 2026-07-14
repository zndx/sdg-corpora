CREATE TABLE toppings (
  id INTEGER NOT NULL,
  topping_id VARCHAR(44),
  name VARCHAR(32),
  tier VARCHAR(32),
  price_adjustment DECIMAL,
  pizza_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (pizza_id) REFERENCES pizzas (pizza_id)
);
