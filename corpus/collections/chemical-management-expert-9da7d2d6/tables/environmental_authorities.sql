CREATE TABLE environmental_authorities (
  environmental_authority_id INTEGER NOT NULL,
  authority_code VARCHAR(44),
  authority_name VARCHAR(32),
  country_code VARCHAR(44),
  established_date DATE,
  competence_level VARCHAR(32),
  is_competent_authority BOOLEAN,
  regulation_id INTEGER,
  PRIMARY KEY (environmental_authority_id),
  FOREIGN KEY (regulation_id) REFERENCES environmental_regulations (regulation_id)
);
