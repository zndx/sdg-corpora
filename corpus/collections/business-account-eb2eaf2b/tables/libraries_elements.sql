CREATE TABLE libraries_elements (
  standard_element_library_id INTEGER NOT NULL,
  motion_element_id INTEGER NOT NULL,
  PRIMARY KEY (standard_element_library_id, motion_element_id),
  FOREIGN KEY (standard_element_library_id) REFERENCES standard_element_libraries (standard_element_library_id),
  FOREIGN KEY (motion_element_id) REFERENCES motion_elements (id)
);
