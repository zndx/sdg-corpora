CREATE TABLE nerve_fibers (
  nerve_fiber_id INTEGER NOT NULL,
  fiber_id VARCHAR(44),
  location VARCHAR(32),
  diameter DECIMAL,
  signal_speed DECIMAL,
  neural_implant_id INTEGER,
  muscle_id INTEGER,
  PRIMARY KEY (nerve_fiber_id),
  FOREIGN KEY (neural_implant_id) REFERENCES neural_implants (neural_implant_id),
  FOREIGN KEY (muscle_id) REFERENCES muscles (muscle_id)
);
