CREATE TABLE demographic_surveys (
  demographic_survey_id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  survey_year INTEGER,
  territory VARCHAR(32),
  total_population_count DECIMAL,
  child_population_count DECIMAL,
  child_population_percentage DECIMAL,
  under_five_percentage DECIMAL,
  five_to_nine_percentage DECIMAL,
  ten_to_fourteen_percentage DECIMAL,
  fifteen_to_seventeen_percentage DECIMAL,
  statistical_bureau_id INTEGER,
  geographic_region_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (demographic_survey_id),
  FOREIGN KEY (statistical_bureau_id) REFERENCES statistical_bureaus (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
