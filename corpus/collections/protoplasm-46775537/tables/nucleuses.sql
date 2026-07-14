CREATE TABLE nucleuses (
  id INTEGER NOT NULL,
  nucleus_id VARCHAR(44),
  intelligence_level DECIMAL,
  chromosome_count INTEGER,
  division_state VARCHAR(32),
  cell_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (cell_id) REFERENCES cells (cell_id)
);
