CREATE TABLE proteins (
  protein_id INTEGER NOT NULL,
  uniprot_accession VARCHAR(32),
  gene_name VARCHAR(32),
  organism VARCHAR(32),
  molecular_weight DECIMAL,
  sequence_length INTEGER,
  function VARCHAR(32),
  protein_structure_id INTEGER,
  small_molecule_id INTEGER,
  pathogen_id INTEGER,
  PRIMARY KEY (protein_id),
  FOREIGN KEY (protein_structure_id) REFERENCES protein_structures (id),
  FOREIGN KEY (small_molecule_id) REFERENCES small_molecules (id),
  FOREIGN KEY (pathogen_id) REFERENCES pathogens (pathogen_id)
);
