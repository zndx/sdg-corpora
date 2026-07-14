CREATE TABLE breeding_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  PRIMARY KEY (id)
);
