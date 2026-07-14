CREATE TABLE courses_materials (
  course_code VARCHAR(32) NOT NULL,
  material_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (course_code, material_code),
  FOREIGN KEY (course_code) REFERENCES academic_courses (course_code),
  FOREIGN KEY (material_code) REFERENCES educational_materials (material_code)
);
