CREATE TABLE educational_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  institution_name VARCHAR(32),
  institution_type VARCHAR(32),
  location VARCHAR(32),
  accreditation_body VARCHAR(32),
  PRIMARY KEY (id)
);
