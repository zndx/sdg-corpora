CREATE TABLE effluents_pollutants (
  industrial_effluent_id INTEGER NOT NULL,
  chemical_pollutant_cas_registry_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (industrial_effluent_id, chemical_pollutant_cas_registry_number),
  FOREIGN KEY (industrial_effluent_id) REFERENCES industrial_effluents (id),
  FOREIGN KEY (chemical_pollutant_cas_registry_number) REFERENCES chemical_pollutants (cas_registry_number)
);
