CREATE TABLE dining_packages (
  dining_package_id INTEGER NOT NULL,
  package_identifier VARCHAR(32),
  package_name VARCHAR(32),
  total_price DECIMAL,
  course_count INTEGER,
  includes_beverage BOOLEAN,
  package_status VARCHAR(32),
  beverage_id INTEGER,
  PRIMARY KEY (dining_package_id),
  FOREIGN KEY (beverage_id) REFERENCES beverages (beverage_id)
);
