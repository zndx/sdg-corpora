CREATE TABLE methods_elements (
  method_id INTEGER NOT NULL,
  motion_element_id INTEGER NOT NULL,
  PRIMARY KEY (method_id, motion_element_id),
  FOREIGN KEY (method_id) REFERENCES work_methods (method_id),
  FOREIGN KEY (motion_element_id) REFERENCES motion_elements (id)
);
