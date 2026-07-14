CREATE TABLE systems_initiatives (
  university_support_system_id INTEGER NOT NULL,
  student_led_business_initiative_id INTEGER NOT NULL,
  PRIMARY KEY (university_support_system_id, student_led_business_initiative_id),
  FOREIGN KEY (university_support_system_id) REFERENCES university_support_systems (university_support_system_id),
  FOREIGN KEY (student_led_business_initiative_id) REFERENCES student_led_business_initiatives (id)
);
