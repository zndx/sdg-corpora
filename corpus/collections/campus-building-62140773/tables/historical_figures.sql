CREATE TABLE historical_figures (
  id INTEGER NOT NULL,
  figure_id VARCHAR(35),
  full_name VARCHAR(36),
  birth_year INTEGER,
  death_year INTEGER,
  founded_institution VARCHAR(32),
  enrollment_date DATE,
  statue_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (statue_id) REFERENCES statues (id)
);
