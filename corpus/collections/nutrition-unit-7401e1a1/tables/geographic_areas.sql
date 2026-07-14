CREATE TABLE geographic_areas (
  id INTEGER NOT NULL,
  area_id VARCHAR(44),
  area_name VARCHAR(32),
  population_density INTEGER,
  mortality_rate DECIMAL,
  morbidity_rate DECIMAL,
  administrative_zone VARCHAR(32),
  socioeconomic_status VARCHAR(32),
  infrastructure_level VARCHAR(32),
  nutrition_unit_id INTEGER,
  beneficiary_group_id INTEGER,
  geographic_area_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (nutrition_unit_id) REFERENCES nutrition_units (id),
  FOREIGN KEY (beneficiary_group_id) REFERENCES beneficiary_groups (beneficiary_group_id),
  FOREIGN KEY (geographic_area_id) REFERENCES geographic_areas (id)
);
