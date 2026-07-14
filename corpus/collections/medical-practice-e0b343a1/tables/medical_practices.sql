CREATE TABLE medical_practices (
  medical_practice_id INTEGER NOT NULL,
  practice_name VARCHAR(32),
  registration_number VARCHAR(32),
  address_line VARCHAR(32),
  post_code INTEGER,
  telephone_number VARCHAR(32),
  website_u_r_l VARCHAR(66),
  last_updated_date DATE,
  health_authority_id INTEGER,
  PRIMARY KEY (medical_practice_id),
  FOREIGN KEY (health_authority_id) REFERENCES health_authorities (health_authority_id)
);
