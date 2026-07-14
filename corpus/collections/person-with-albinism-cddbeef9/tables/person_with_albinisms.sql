CREATE TABLE person_with_albinisms (
  person_with_albinism_id INTEGER NOT NULL,
  person_id VARCHAR(32),
  name VARCHAR(34),
  date_of_birth DATE,
  vision_level VARCHAR(32),
  skin_sensitivity VARCHAR(32),
  current_location VARCHAR(32),
  enrolled_in_program BOOLEAN,
  education_program_id INTEGER,
  social_stigma_id INTEGER,
  environmental_accommodation_id INTEGER,
  PRIMARY KEY (person_with_albinism_id),
  FOREIGN KEY (education_program_id) REFERENCES education_programs (id),
  FOREIGN KEY (social_stigma_id) REFERENCES social_stigmas (id),
  FOREIGN KEY (environmental_accommodation_id) REFERENCES environmental_accommodations (environmental_accommodation_id)
);
