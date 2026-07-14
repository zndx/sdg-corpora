CREATE TABLE services_students (
  service_id VARCHAR(44) NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (service_id, student_id),
  FOREIGN KEY (service_id) REFERENCES support_services (service_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
