CREATE TABLE employees_classes (
  employee_id INTEGER NOT NULL,
  internal_training_class_id INTEGER NOT NULL,
  PRIMARY KEY (employee_id, internal_training_class_id),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  FOREIGN KEY (internal_training_class_id) REFERENCES internal_training_classes (id)
);
