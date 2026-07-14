CREATE TABLE laboratories_schools (
  research_laboratory_lab_id INTEGER NOT NULL,
  doctoral_school_id INTEGER NOT NULL,
  PRIMARY KEY (research_laboratory_lab_id, doctoral_school_id),
  FOREIGN KEY (research_laboratory_lab_id) REFERENCES research_laboratories (lab_id),
  FOREIGN KEY (doctoral_school_id) REFERENCES doctoral_schools (id)
);
