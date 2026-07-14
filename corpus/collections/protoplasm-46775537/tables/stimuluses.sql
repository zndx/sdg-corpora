CREATE TABLE stimuluses (
  stimulus_id INTEGER NOT NULL,
  energy_level DECIMAL,
  stimulus_type VARCHAR(32),
  timestamp TIMESTAMP,
  source VARCHAR(32),
  protoplasm_id INTEGER,
  engram_id INTEGER,
  PRIMARY KEY (stimulus_id),
  FOREIGN KEY (protoplasm_id) REFERENCES protoplasms (protoplasm_id),
  FOREIGN KEY (engram_id) REFERENCES engrams (id)
);
