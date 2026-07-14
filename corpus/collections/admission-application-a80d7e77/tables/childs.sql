CREATE TABLE childs (
  id INTEGER NOT NULL,
  child_id INTEGER,
  full_name VARCHAR(36),
  date_of_birth DATE,
  gender VARCHAR(32),
  year_group VARCHAR(32),
  birth_certificate_reference VARCHAR(32),
  has_sibling_child_id INTEGER,
  school_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (has_sibling_child_id) REFERENCES childs (id),
  FOREIGN KEY (school_id) REFERENCES schools (school_id)
);
