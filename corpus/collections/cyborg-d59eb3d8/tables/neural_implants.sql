CREATE TABLE neural_implants (
  neural_implant_id INTEGER NOT NULL,
  implant_id VARCHAR(44),
  type VARCHAR(32),
  material VARCHAR(32),
  power_source VARCHAR(32),
  signal_format VARCHAR(32),
  nerve_fiber_id INTEGER,
  computer_system_id INTEGER,
  PRIMARY KEY (neural_implant_id),
  FOREIGN KEY (nerve_fiber_id) REFERENCES nerve_fibers (nerve_fiber_id),
  FOREIGN KEY (computer_system_id) REFERENCES computer_systems (id)
);
