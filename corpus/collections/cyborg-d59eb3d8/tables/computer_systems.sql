CREATE TABLE computer_systems (
  id INTEGER NOT NULL,
  system_id INTEGER,
  processing_power DECIMAL,
  storage_capacity DECIMAL,
  communication_protocol VARCHAR(32),
  status VARCHAR(32),
  neural_implant_id INTEGER,
  cyborg_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (neural_implant_id) REFERENCES neural_implants (neural_implant_id),
  FOREIGN KEY (cyborg_id) REFERENCES cyborgs (id)
);
