CREATE TABLE motion_elements (
  id INTEGER NOT NULL,
  element_id INTEGER,
  element_type VARCHAR(32),
  standard_time_value DECIMAL,
  copyright_owner VARCHAR(32),
  method_id INTEGER,
  localized_description_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (method_id) REFERENCES work_methods (method_id),
  FOREIGN KEY (localized_description_id) REFERENCES localized_descriptions (id)
);
