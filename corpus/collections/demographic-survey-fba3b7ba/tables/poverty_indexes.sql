CREATE TABLE poverty_indexes (
  poverty_index_id VARCHAR(32) NOT NULL,
  index_year INTEGER,
  household_poverty_rate DECIMAL,
  child_poverty_rate DECIMAL,
  poor_households_with_children_percent DECIMAL,
  region VARCHAR(32),
  geographic_region_id INTEGER,
  demographic_survey_id INTEGER,
  PRIMARY KEY (poverty_index_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (demographic_survey_id) REFERENCES demographic_surveys (demographic_survey_id)
);
