CREATE TABLE programs_educators (
  program_id INTEGER NOT NULL,
  educator_id INTEGER NOT NULL,
  PRIMARY KEY (program_id, educator_id),
  FOREIGN KEY (program_id) REFERENCES programs (id),
  FOREIGN KEY (educator_id) REFERENCES educators (id)
);
