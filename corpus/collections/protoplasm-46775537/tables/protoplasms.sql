CREATE TABLE protoplasms (
  protoplasm_id INTEGER NOT NULL,
  origin_date TIMESTAMP,
  irritability_level DECIMAL,
  engram_count INTEGER,
  nuclear_intelligence BOOLEAN,
  protoplasm_type VARCHAR(32),
  cell_id INTEGER,
  engram_id INTEGER,
  PRIMARY KEY (protoplasm_id),
  FOREIGN KEY (cell_id) REFERENCES cells (cell_id),
  FOREIGN KEY (engram_id) REFERENCES engrams (id)
);
