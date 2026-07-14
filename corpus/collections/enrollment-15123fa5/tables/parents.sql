CREATE TABLE parents (
  id INTEGER NOT NULL,
  parent_id VARCHAR(32),
  first_name VARCHAR(32),
  chinese_name VARCHAR(32),
  home_phone VARCHAR(32),
  cell_phone VARCHAR(32),
  email VARCHAR(32),
  home_address VARCHAR(32),
  city VARCHAR(32),
  zip_code VARCHAR(44),
  student_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
