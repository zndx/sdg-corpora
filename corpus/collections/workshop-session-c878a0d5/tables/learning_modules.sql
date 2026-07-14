CREATE TABLE learning_modules (
  id INTEGER NOT NULL,
  module_id VARCHAR(33),
  title VARCHAR(32),
  duration_minutes INTEGER,
  delivery_method VARCHAR(32),
  difficulty_level VARCHAR(32),
  learning_objective VARCHAR(32),
  PRIMARY KEY (id)
);
