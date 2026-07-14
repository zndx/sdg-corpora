CREATE TABLE students (
  id INTEGER NOT NULL,
  student_name VARCHAR(32),
  contact_number VARCHAR(32),
  class_code VARCHAR(32),
  order_status VARCHAR(32),
  belongs_from_class_class_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (belongs_from_class_class_code) REFERENCES student_classes (class_code)
);
