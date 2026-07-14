CREATE TABLE biodiesel_specifications (
  biodiesel_specification_id INTEGER NOT NULL,
  specification_id VARCHAR(32),
  standard_number VARCHAR(32),
  publication_year INTEGER,
  grade VARCHAR(32),
  is_critical BOOLEAN,
  PRIMARY KEY (biodiesel_specification_id)
);
