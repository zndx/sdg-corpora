CREATE TABLE statistical_bureaus (
  id INTEGER NOT NULL,
  bureau_id VARCHAR(32),
  bureau_name VARCHAR(32),
  location VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_email VARCHAR(32),
  demographic_survey_id INTEGER,
  statistical_bureau_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (demographic_survey_id) REFERENCES demographic_surveys (demographic_survey_id),
  FOREIGN KEY (statistical_bureau_id) REFERENCES statistical_bureaus (id)
);
