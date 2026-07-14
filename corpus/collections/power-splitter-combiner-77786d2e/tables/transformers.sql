CREATE TABLE transformers (
  transformer_id INTEGER NOT NULL,
  transformer_identifier VARCHAR(32),
  turns_ratio VARCHAR(32),
  impedance_ratio DECIMAL,
  phase_shift DECIMAL,
  status VARCHAR(32),
  power_splitter_combiner_id INTEGER,
  PRIMARY KEY (transformer_id),
  FOREIGN KEY (power_splitter_combiner_id) REFERENCES power_splitter_combiners (id)
);
