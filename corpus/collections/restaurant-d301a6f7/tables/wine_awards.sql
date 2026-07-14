CREATE TABLE wine_awards (
  id INTEGER NOT NULL,
  award_id VARCHAR(44),
  award_name VARCHAR(32),
  issuing_organization VARCHAR(33),
  award_year INTEGER,
  minimum_selections INTEGER,
  is_grand_award BOOLEAN,
  restaurant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
);
