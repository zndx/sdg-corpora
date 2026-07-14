CREATE TABLE math_based_degrees (
  id INTEGER NOT NULL,
  degree_name VARCHAR(32),
  requires_consecutive_math BOOLEAN,
  requires_physics_or_chem_or_bio BOOLEAN,
  target_institution VARCHAR(32),
  PRIMARY KEY (id)
);
