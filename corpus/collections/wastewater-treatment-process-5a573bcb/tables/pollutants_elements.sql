CREATE TABLE pollutants_elements (
  chemical_pollutant_cas_registry_number VARCHAR(32) NOT NULL,
  chemical_element_id INTEGER NOT NULL,
  PRIMARY KEY (chemical_pollutant_cas_registry_number, chemical_element_id),
  FOREIGN KEY (chemical_pollutant_cas_registry_number) REFERENCES chemical_pollutants (cas_registry_number),
  FOREIGN KEY (chemical_element_id) REFERENCES chemical_elements (id)
);
