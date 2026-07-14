CREATE TABLE cyborgs (
  id INTEGER NOT NULL,
  cyborg_id VARCHAR(44),
  classification VARCHAR(32),
  implant_location VARCHAR(32),
  neural_integration_level DECIMAL,
  status VARCHAR(32),
  neural_implant_id INTEGER,
  cyborgation_process_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (neural_implant_id) REFERENCES neural_implants (neural_implant_id),
  FOREIGN KEY (cyborgation_process_id) REFERENCES cyborgation_processes (id)
);
