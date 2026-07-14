CREATE TABLE officer_roles (
  role_code VARCHAR(32) NOT NULL,
  role_name VARCHAR(32),
  is_executive BOOLEAN,
  requires_insurance_training BOOLEAN,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (role_code)
);
