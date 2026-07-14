CREATE TABLE engrams (
  id INTEGER NOT NULL,
  engram_id VARCHAR(44),
  stimulus_energy DECIMAL,
  reaction_pattern VARCHAR(32),
  retention_date TIMESTAMP,
  disorder_association BOOLEAN,
  protoplasm_id INTEGER,
  stimulus_id INTEGER,
  mental_disorder_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (protoplasm_id) REFERENCES protoplasms (protoplasm_id),
  FOREIGN KEY (stimulus_id) REFERENCES stimuluses (stimulus_id),
  FOREIGN KEY (mental_disorder_id) REFERENCES mental_disorders (id)
);
