CREATE TABLE sign_standards (
  id INTEGER NOT NULL,
  standard_code VARCHAR(32),
  standard_version VARCHAR(32),
  required_size VARCHAR(32),
  required_legend VARCHAR(32),
  retroreflectivity_level VARCHAR(32),
  illumination_requirement BOOLEAN,
  regulatory_sign_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (regulatory_sign_id) REFERENCES regulatory_signs (id)
);
