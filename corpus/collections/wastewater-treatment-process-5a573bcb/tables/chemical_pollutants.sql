CREATE TABLE chemical_pollutants (
  pollutant_identifier VARCHAR(32),
  chemical_name VARCHAR(32),
  cas_registry_number VARCHAR(32) NOT NULL,
  molecular_weight DECIMAL,
  pollutant_class VARCHAR(36),
  concentration_threshold DECIMAL,
  PRIMARY KEY (cas_registry_number)
);
