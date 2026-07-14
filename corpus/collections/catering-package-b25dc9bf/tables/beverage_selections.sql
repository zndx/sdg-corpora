CREATE TABLE beverage_selections (
  id INTEGER NOT NULL,
  selection_id VARCHAR(32),
  selection_name VARCHAR(32),
  includes_hot_beverages BOOLEAN,
  includes_cold_beverages BOOLEAN,
  includes_alcohol BOOLEAN,
  catering_package_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (catering_package_id) REFERENCES catering_packages (id)
);
