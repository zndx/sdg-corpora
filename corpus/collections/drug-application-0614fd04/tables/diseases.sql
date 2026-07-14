CREATE TABLE diseases (
  disease_id VARCHAR(44) NOT NULL,
  disease_name VARCHAR(32),
  icd_code VARCHAR(44),
  prevalence DECIMAL,
  incidence DECIMAL,
  mortality_rate DECIMAL,
  chronic_status BOOLEAN,
  transmission_route VARCHAR(32),
  primary_treatment VARCHAR(32),
  global_burden VARCHAR(32),
  active_pharmaceutical_ingredient_api_id VARCHAR(44),
  geographic_region_id INTEGER,
  has_carrier_count_geographic_region_id INTEGER,
  PRIMARY KEY (disease_id),
  FOREIGN KEY (active_pharmaceutical_ingredient_api_id) REFERENCES active_pharmaceutical_ingredients (api_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id),
  FOREIGN KEY (has_carrier_count_geographic_region_id) REFERENCES geographic_regions (id)
);
