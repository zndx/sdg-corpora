CREATE TABLE catering_packages (
  id INTEGER NOT NULL,
  package_id VARCHAR(32),
  package_name VARCHAR(32),
  meal_period VARCHAR(32),
  base_price_per_person DECIMAL,
  is_buffet BOOLEAN,
  includes_dessert BOOLEAN,
  beverage_selection_id INTEGER,
  service_charge_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (beverage_selection_id) REFERENCES beverage_selections (id),
  FOREIGN KEY (service_charge_id) REFERENCES service_charges (id)
);
