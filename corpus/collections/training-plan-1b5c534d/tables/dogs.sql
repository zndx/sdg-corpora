CREATE TABLE dogs (
  dog_id INTEGER NOT NULL,
  dog_identifier VARCHAR(32),
  breed VARCHAR(32),
  age_years INTEGER,
  weight_kg DECIMAL,
  fitness_level VARCHAR(32),
  health_status VARCHAR(32),
  PRIMARY KEY (dog_id)
);
