CREATE TABLE initiatives_systems (
  student_led_business_initiative_id INTEGER NOT NULL,
  university_support_system_id INTEGER NOT NULL,
  PRIMARY KEY (student_led_business_initiative_id, university_support_system_id),
  FOREIGN KEY (student_led_business_initiative_id) REFERENCES student_led_business_initiatives (id),
  FOREIGN KEY (university_support_system_id) REFERENCES university_support_systems (university_support_system_id)
);
