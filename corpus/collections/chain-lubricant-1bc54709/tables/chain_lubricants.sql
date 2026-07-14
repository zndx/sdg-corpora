CREATE TABLE chain_lubricants (
  lubricant_id VARCHAR(44) NOT NULL,
  chemical_family VARCHAR(32),
  base_name VARCHAR(32),
  viscosity_grade VARCHAR(32),
  is_tacky BOOLEAN,
  is_soluble_moly BOOLEAN,
  is_e_p BOOLEAN,
  is_aerosol BOOLEAN,
  operating_condition_id INTEGER,
  manufacturer_id INTEGER,
  PRIMARY KEY (lubricant_id),
  FOREIGN KEY (operating_condition_id) REFERENCES operating_conditions (operating_condition_id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)
);
