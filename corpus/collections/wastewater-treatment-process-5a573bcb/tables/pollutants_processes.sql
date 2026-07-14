CREATE TABLE pollutants_processes (
  chemical_pollutant_cas_registry_number VARCHAR(32) NOT NULL,
  wastewater_treatment_process_id INTEGER NOT NULL,
  PRIMARY KEY (chemical_pollutant_cas_registry_number, wastewater_treatment_process_id),
  FOREIGN KEY (chemical_pollutant_cas_registry_number) REFERENCES chemical_pollutants (cas_registry_number),
  FOREIGN KEY (wastewater_treatment_process_id) REFERENCES wastewater_treatment_processes (id)
);
