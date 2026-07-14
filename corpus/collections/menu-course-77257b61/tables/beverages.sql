CREATE TABLE beverages (
  beverage_id INTEGER NOT NULL,
  beverage_identifier VARCHAR(32),
  beverage_name VARCHAR(32),
  beverage_type VARCHAR(32),
  serving_temperature VARCHAR(32),
  alcohol_content DECIMAL,
  menu_course_id INTEGER,
  dining_package_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (beverage_id),
  FOREIGN KEY (menu_course_id) REFERENCES menu_courses (id),
  FOREIGN KEY (dining_package_id) REFERENCES dining_packages (dining_package_id)
);
