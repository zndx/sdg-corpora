CREATE TABLE technical_support_engineers (
  technical_support_engineer_id INTEGER NOT NULL,
  engineer_id VARCHAR(35),
  name VARCHAR(32),
  location VARCHAR(32),
  experience_years INTEGER,
  languages VARCHAR(32),
  education_level VARCHAR(32),
  employment_status VARCHAR(32),
  PRIMARY KEY (technical_support_engineer_id)
);
