CREATE TABLE students_orders (
  student_id INTEGER NOT NULL,
  student_order_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, student_order_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (student_order_id) REFERENCES student_orders (student_order_id)
);
