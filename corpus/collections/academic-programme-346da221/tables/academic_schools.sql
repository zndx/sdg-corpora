CREATE TABLE academic_schools (
  academic_school_id INTEGER NOT NULL,
  school_id INTEGER,
  school_name VARCHAR(32),
  university_id VARCHAR(40),
  establishment_date TIMESTAMP,
  status VARCHAR(32),
  dean_id VARCHAR(44),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  part_of_university_university_id INTEGER,
  PRIMARY KEY (academic_school_id),
  FOREIGN KEY (part_of_university_university_id) REFERENCES universities (id)
);
