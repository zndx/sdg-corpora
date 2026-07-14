CREATE TABLE notebook_files (
  notebook_file_id INTEGER NOT NULL,
  file_identifier VARCHAR(32),
  file_name VARCHAR(32),
  file_extension VARCHAR(32),
  creation_date DATE,
  checksum VARCHAR(32),
  computational_example_id INTEGER,
  PRIMARY KEY (notebook_file_id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id)
);
