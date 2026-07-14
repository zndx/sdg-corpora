CREATE TABLE elements_pollutants (
  chemical_element_id INTEGER NOT NULL,
  chemical_pollutant_cas_registry_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (chemical_element_id, chemical_pollutant_cas_registry_number),
  FOREIGN KEY (chemical_element_id) REFERENCES chemical_elements (id),
  FOREIGN KEY (chemical_pollutant_cas_registry_number) REFERENCES chemical_pollutants (cas_registry_number)
);
