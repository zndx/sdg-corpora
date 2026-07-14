CREATE TABLE staff_roles (
  role_code VARCHAR(32) NOT NULL,
  role_title VARCHAR(32),
  certification_level VARCHAR(32),
  training_completion_date DATE,
  access_level VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (role_code)
);
