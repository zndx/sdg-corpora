CREATE TABLE services_enrollments (
  support_service_id INTEGER NOT NULL,
  student_enrollment_id INTEGER NOT NULL,
  PRIMARY KEY (support_service_id, student_enrollment_id),
  FOREIGN KEY (support_service_id) REFERENCES support_services (support_service_id),
  FOREIGN KEY (student_enrollment_id) REFERENCES student_enrollments (student_enrollment_id)
);
