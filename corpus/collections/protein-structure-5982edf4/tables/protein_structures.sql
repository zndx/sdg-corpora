CREATE TABLE protein_structures (
  id INTEGER NOT NULL,
  structure_id INTEGER,
  pdb_code VARCHAR(44),
  resolution DECIMAL,
  method VARCHAR(32),
  date_resolved TIMESTAMP,
  chain_count INTEGER,
  rmsd_value DECIMAL,
  software_tool_id INTEGER,
  protein_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (software_tool_id) REFERENCES software_tools (id),
  FOREIGN KEY (protein_id) REFERENCES proteins (protein_id)
);
