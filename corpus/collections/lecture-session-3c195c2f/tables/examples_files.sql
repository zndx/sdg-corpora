CREATE TABLE examples_files (
  computational_example_id INTEGER NOT NULL,
  notebook_file_id INTEGER NOT NULL,
  PRIMARY KEY (computational_example_id, notebook_file_id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id),
  FOREIGN KEY (notebook_file_id) REFERENCES notebook_files (notebook_file_id)
);
