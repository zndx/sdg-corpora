CREATE TABLE university_officials (
  official_id VARCHAR(42) NOT NULL,
  full_name VARCHAR(36),
  role VARCHAR(32),
  department VARCHAR(32),
  employment_status VARCHAR(32),
  hire_date DATE,
  PRIMARY KEY (official_id)
);
