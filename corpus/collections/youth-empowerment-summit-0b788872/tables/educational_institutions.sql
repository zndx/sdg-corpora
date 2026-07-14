CREATE TABLE educational_institutions (
  educational_institution_id INTEGER NOT NULL,
  institution_id INTEGER,
  institution_name VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  school_level VARCHAR(32),
  is_safe_space BOOLEAN,
  youth_empowerment_summit_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (educational_institution_id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id)
);
