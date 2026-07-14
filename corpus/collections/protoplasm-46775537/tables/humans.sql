CREATE TABLE humans (
  id INTEGER NOT NULL,
  human_id VARCHAR(44),
  birth_date TIMESTAMP,
  genetic_lineage VARCHAR(32),
  early_stimulus_exposure DECIMAL,
  collective_unconscious_access BOOLEAN,
  protoplasm_id INTEGER,
  stimulus_id INTEGER,
  engram_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (protoplasm_id) REFERENCES protoplasms (protoplasm_id),
  FOREIGN KEY (stimulus_id) REFERENCES stimuluses (stimulus_id),
  FOREIGN KEY (engram_id) REFERENCES engrams (id)
);
