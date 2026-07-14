CREATE TABLE entrepreneurs_initiatives (
  student_entrepreneur_student_id VARCHAR(32) NOT NULL,
  student_led_business_initiative_id INTEGER NOT NULL,
  PRIMARY KEY (student_entrepreneur_student_id, student_led_business_initiative_id),
  FOREIGN KEY (student_entrepreneur_student_id) REFERENCES student_entrepreneurs (student_id),
  FOREIGN KEY (student_led_business_initiative_id) REFERENCES student_led_business_initiatives (id)
);
