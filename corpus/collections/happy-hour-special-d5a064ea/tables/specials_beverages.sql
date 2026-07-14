CREATE TABLE specials_beverages (
  happy_hour_special_id INTEGER NOT NULL,
  beverage_id INTEGER NOT NULL,
  PRIMARY KEY (happy_hour_special_id, beverage_id),
  FOREIGN KEY (happy_hour_special_id) REFERENCES happy_hour_specials (id),
  FOREIGN KEY (beverage_id) REFERENCES beverages (id)
);
