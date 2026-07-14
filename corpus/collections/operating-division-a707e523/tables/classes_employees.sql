CREATE TABLE classes_employees (
  internal_training_class_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (internal_training_class_id, employee_id),
  FOREIGN KEY (internal_training_class_id) REFERENCES internal_training_classes (id),
  FOREIGN KEY (employee_id) REFERENCES employees (id)
);
