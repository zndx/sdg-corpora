CREATE TABLE municipalities (
  id INTEGER NOT NULL,
  municipality_i_d VARCHAR(32),
  municipality_name VARCHAR(32),
  state VARCHAR(32),
  population INTEGER,
  area_sq_km DECIMAL,
  incorporation_date DATE,
  quality_improvement_program_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (quality_improvement_program_id)
);
