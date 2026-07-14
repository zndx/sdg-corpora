CREATE TABLE participating_employers (
  id INTEGER NOT NULL,
  employer_id VARCHAR(61),
  employer_name VARCHAR(36),
  ein VARCHAR(32),
  plan_start_date DATE,
  PRIMARY KEY (id)
);
