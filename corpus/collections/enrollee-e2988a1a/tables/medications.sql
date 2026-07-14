CREATE TABLE medications (
  medication_id INTEGER NOT NULL,
  brand_name VARCHAR(33),
  generic_name VARCHAR(32),
  is_formulary BOOLEAN,
  mme_limit DECIMAL,
  controlled_substance_schedule VARCHAR(32),
  PRIMARY KEY (medication_id)
);
