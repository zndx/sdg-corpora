CREATE TABLE food_formulations (
  id INTEGER NOT NULL,
  formulation_id VARCHAR(32),
  product_code VARCHAR(32),
  colorant_source VARCHAR(32),
  concentration DECIMAL,
  ph_level DECIMAL,
  shelf_life INTEGER,
  regulatory_status VARCHAR(32),
  small_molecule_id INTEGER,
  food_industry_application_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (small_molecule_id) REFERENCES small_molecules (id),
  FOREIGN KEY (food_industry_application_id) REFERENCES food_industry_applications (food_industry_application_id)
);
