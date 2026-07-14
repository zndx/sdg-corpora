CREATE TABLE universities_schools (
  university_id INTEGER NOT NULL,
  academic_school_id INTEGER NOT NULL,
  PRIMARY KEY (university_id, academic_school_id),
  FOREIGN KEY (university_id) REFERENCES universities (id),
  FOREIGN KEY (academic_school_id) REFERENCES academic_schools (academic_school_id)
);
