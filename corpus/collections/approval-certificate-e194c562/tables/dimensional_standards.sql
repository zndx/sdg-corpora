CREATE TABLE dimensional_standards (
  dimensional_standard_id INTEGER NOT NULL,
  standard_name VARCHAR(32),
  standard_version VARCHAR(32),
  pressure_rating_basis VARCHAR(32),
  PRIMARY KEY (dimensional_standard_id)
);
