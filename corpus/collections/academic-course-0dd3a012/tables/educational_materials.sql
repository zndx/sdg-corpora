CREATE TABLE educational_materials (
  material_code VARCHAR(32) NOT NULL,
  title VARCHAR(32),
  publisher VARCHAR(32),
  unit_price VARCHAR(32),
  category VARCHAR(32),
  is_optional BOOLEAN,
  required_quantity INTEGER,
  course_code VARCHAR(32),
  student_order_id INTEGER,
  PRIMARY KEY (material_code),
  FOREIGN KEY (course_code) REFERENCES academic_courses (course_code),
  FOREIGN KEY (student_order_id) REFERENCES student_orders (student_order_id)
);
