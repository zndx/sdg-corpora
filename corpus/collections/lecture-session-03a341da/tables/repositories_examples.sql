CREATE TABLE repositories_examples (
  digital_repository_id INTEGER NOT NULL,
  computational_example_id INTEGER NOT NULL,
  PRIMARY KEY (digital_repository_id, computational_example_id),
  FOREIGN KEY (digital_repository_id) REFERENCES digital_repositories (id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id)
);
