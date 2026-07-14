CREATE TABLE pizzas (
  pizza_id VARCHAR(32) NOT NULL,
  name VARCHAR(32),
  sauce_type VARCHAR(32),
  crust_type VARCHAR(32),
  is_specialty BOOLEAN,
  PRIMARY KEY (pizza_id)
);
