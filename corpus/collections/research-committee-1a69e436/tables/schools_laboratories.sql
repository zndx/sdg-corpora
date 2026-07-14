CREATE TABLE schools_laboratories (
  doctoral_school_id INTEGER NOT NULL,
  research_laboratory_lab_id INTEGER NOT NULL,
  PRIMARY KEY (doctoral_school_id, research_laboratory_lab_id),
  FOREIGN KEY (doctoral_school_id) REFERENCES doctoral_schools (id),
  FOREIGN KEY (research_laboratory_lab_id) REFERENCES research_laboratories (lab_id)
);
