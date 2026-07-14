CREATE TABLE pharmacokinetic_parameters (
  id INTEGER NOT NULL,
  parameter_id VARCHAR(44),
  parameter_name VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  species VARCHAR(32),
  source_reference VARCHAR(32),
  chemical_substance_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chemical_substance_id) REFERENCES chemical_substances (chemical_substance_id)
);
