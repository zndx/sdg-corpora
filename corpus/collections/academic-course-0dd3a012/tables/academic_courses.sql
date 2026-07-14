CREATE TABLE academic_courses (
  course_code VARCHAR(32) NOT NULL,
  course_name VARCHAR(32),
  grade_level INTEGER,
  is_mother_tongue BOOLEAN,
  is_compulsory BOOLEAN,
  class_code VARCHAR(32),
  PRIMARY KEY (course_code),
  FOREIGN KEY (class_code) REFERENCES student_classes (class_code)
);
