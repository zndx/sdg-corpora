CREATE TABLE authorities_practices (
  health_authority_id INTEGER NOT NULL,
  medical_practice_id INTEGER NOT NULL,
  PRIMARY KEY (health_authority_id, medical_practice_id),
  FOREIGN KEY (health_authority_id) REFERENCES health_authorities (health_authority_id),
  FOREIGN KEY (medical_practice_id) REFERENCES medical_practices (medical_practice_id)
);
