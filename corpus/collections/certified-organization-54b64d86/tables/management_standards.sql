CREATE TABLE management_standards (
  id INTEGER NOT NULL,
  standard_identifier VARCHAR(32),
  standard_title VARCHAR(32),
  version_number VARCHAR(32),
  issuing_body VARCHAR(32),
  publication_year INTEGER,
  PRIMARY KEY (id)
);
