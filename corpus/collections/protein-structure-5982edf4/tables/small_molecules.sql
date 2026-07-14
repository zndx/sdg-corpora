CREATE TABLE small_molecules (
  id INTEGER NOT NULL,
  molecule_id VARCHAR(44),
  smiles VARCHAR(32),
  iupac_name VARCHAR(32),
  molecular_formula VARCHAR(32),
  molecular_weight DECIMAL,
  activity_class VARCHAR(32),
  toxicity_score DECIMAL,
  optimization_status VARCHAR(32),
  protein_id INTEGER,
  food_formulation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (protein_id) REFERENCES proteins (protein_id),
  FOREIGN KEY (food_formulation_id) REFERENCES food_formulations (id)
);
