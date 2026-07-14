CREATE TABLE environmental_regulations (
  regulation_id INTEGER NOT NULL,
  regulation_title VARCHAR(32),
  issuing_body VARCHAR(32),
  effective_date DATE,
  jurisdiction VARCHAR(32),
  status VARCHAR(32),
  environmental_authority_id INTEGER,
  chemical_activity_id INTEGER,
  PRIMARY KEY (regulation_id),
  FOREIGN KEY (environmental_authority_id) REFERENCES environmental_authorities (environmental_authority_id),
  FOREIGN KEY (chemical_activity_id) REFERENCES chemical_activities (id)
);
