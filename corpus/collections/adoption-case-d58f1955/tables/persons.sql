CREATE TABLE persons (
  id INTEGER NOT NULL,
  full_name VARCHAR(36),
  adult_to_be_adopted_social_security_number VARCHAR(32),
  is_birth_father_of_adult_to_be_adopted_social_security_number VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (adult_to_be_adopted_social_security_number) REFERENCES adult_to_be_adopteds (social_security_number),
  FOREIGN KEY (is_birth_father_of_adult_to_be_adopted_social_security_number) REFERENCES adult_to_be_adopteds (social_security_number)
);
