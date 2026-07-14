CREATE TABLE cyborgation_processes (
  id INTEGER NOT NULL,
  process_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  procedure_type VARCHAR(32),
  success_rate DECIMAL,
  cyborg_id INTEGER,
  neural_implant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cyborg_id) REFERENCES cyborgs (id),
  FOREIGN KEY (neural_implant_id) REFERENCES neural_implants (neural_implant_id)
);
