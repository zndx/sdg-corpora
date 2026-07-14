CREATE TABLE c_s_r_components (
  id INTEGER NOT NULL,
  component_identifier VARCHAR(32),
  component_name VARCHAR(32),
  component_type VARCHAR(32),
  budget DECIMAL,
  target_audience VARCHAR(32),
  corporate_responsibility_programme_id INTEGER,
  geographic_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporate_responsibility_programme_id) REFERENCES corporate_responsibility_programmes (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id)
);
