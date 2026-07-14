CREATE TABLE software_packages (
  id INTEGER NOT NULL,
  package_identifier VARCHAR(32),
  name VARCHAR(32),
  version VARCHAR(32),
  developer VARCHAR(32),
  license_type VARCHAR(32),
  computational_example_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (computational_example_id) REFERENCES computational_examples (id)
);
