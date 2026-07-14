CREATE TABLE jurisdictions_initiatives (
  geographic_jurisdiction_id INTEGER NOT NULL,
  student_led_business_initiative_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_jurisdiction_id, student_led_business_initiative_id),
  FOREIGN KEY (geographic_jurisdiction_id) REFERENCES geographic_jurisdictions (id),
  FOREIGN KEY (student_led_business_initiative_id) REFERENCES student_led_business_initiatives (id)
);
