CREATE TABLE orders_materials (
  student_order_id INTEGER NOT NULL,
  material_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (student_order_id, material_code),
  FOREIGN KEY (student_order_id) REFERENCES student_orders (student_order_id),
  FOREIGN KEY (material_code) REFERENCES educational_materials (material_code)
);
