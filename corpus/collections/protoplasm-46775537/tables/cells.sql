CREATE TABLE cells (
  cell_id INTEGER NOT NULL,
  division_stage VARCHAR(32),
  nucleus_present BOOLEAN,
  cell_type VARCHAR(32),
  creation_date TIMESTAMP,
  protoplasm_id INTEGER,
  nucleus_id INTEGER,
  PRIMARY KEY (cell_id),
  FOREIGN KEY (protoplasm_id) REFERENCES protoplasms (protoplasm_id),
  FOREIGN KEY (nucleus_id) REFERENCES nucleuses (id)
);
