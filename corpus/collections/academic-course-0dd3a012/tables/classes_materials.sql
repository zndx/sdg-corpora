CREATE TABLE classes_materials (
  class_code VARCHAR(32) NOT NULL,
  material_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (class_code, material_code),
  FOREIGN KEY (class_code) REFERENCES student_classes (class_code),
  FOREIGN KEY (material_code) REFERENCES educational_materials (material_code)
);
