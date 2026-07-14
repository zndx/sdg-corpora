CREATE TABLE child_labor_statistics (
  id INTEGER NOT NULL,
  labor_stat_id VARCHAR(40),
  stat_year INTEGER,
  employment_rate DECIMAL,
  male_employment_rate DECIMAL,
  female_employment_rate DECIMAL,
  school_and_work_rate DECIMAL,
  average_daily_wage DECIMAL,
  weekly_working_hours DECIMAL,
  currency_code VARCHAR(44),
  geographic_region_id INTEGER,
  demographic_survey_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (demographic_survey_id) REFERENCES demographic_surveys (demographic_survey_id)
);
