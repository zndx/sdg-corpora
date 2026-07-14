CREATE TABLE pollutants_effluents (
  chemical_pollutant_cas_registry_number VARCHAR(32) NOT NULL,
  industrial_effluent_id INTEGER NOT NULL,
  PRIMARY KEY (chemical_pollutant_cas_registry_number, industrial_effluent_id),
  FOREIGN KEY (chemical_pollutant_cas_registry_number) REFERENCES chemical_pollutants (cas_registry_number),
  FOREIGN KEY (industrial_effluent_id) REFERENCES industrial_effluents (id)
);
