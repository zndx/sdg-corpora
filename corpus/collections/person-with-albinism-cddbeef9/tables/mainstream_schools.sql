CREATE TABLE mainstream_schools (
  id INTEGER NOT NULL,
  school_id INTEGER,
  school_name VARCHAR(32),
  location VARCHAR(32),
  academic_standard VARCHAR(32),
  enrollment_capacity INTEGER,
  has_inclusive_policy BOOLEAN,
  last_inspection_date DATE,
  environmental_accommodation_id INTEGER,
  social_stigma_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (environmental_accommodation_id) REFERENCES environmental_accommodations (environmental_accommodation_id),
  FOREIGN KEY (social_stigma_id) REFERENCES social_stigmas (id)
);
