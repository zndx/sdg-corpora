CREATE TABLE hybrots (
  id INTEGER NOT NULL,
  hybrot_id INTEGER,
  biological_component VARCHAR(32),
  electronic_component VARCHAR(32),
  longevity DECIMAL,
  status VARCHAR(32),
  neural_implant_id INTEGER,
  computer_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (neural_implant_id) REFERENCES neural_implants (neural_implant_id),
  FOREIGN KEY (computer_system_id) REFERENCES computer_systems (id)
);
