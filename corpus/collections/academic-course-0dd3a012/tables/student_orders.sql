CREATE TABLE student_orders (
  student_order_id INTEGER NOT NULL,
  order_date TIMESTAMP,
  total_amount VARCHAR(32),
  section_a DECIMAL,
  section_b DECIMAL,
  section_c DECIMAL,
  collection_status VARCHAR(32),
  student_id INTEGER,
  PRIMARY KEY (student_order_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
