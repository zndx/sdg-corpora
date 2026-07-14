CREATE TABLE hous_training_modulesHousingAdviser (
  module_id VARCHAR(33) NOT NULL,
  housing_adviser_id INTEGER NOT NULL,
  PRIMARY KEY (module_id, housing_adviser_id),
  FOREIGN KEY (module_id) REFERENCES hous_training_modules (module_id),
  FOREIGN KEY (housing_adviser_id) REFERENCES hous_housing_advisers (id)
);
