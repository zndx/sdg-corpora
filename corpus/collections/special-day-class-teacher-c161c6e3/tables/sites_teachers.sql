CREATE TABLE sites_teachers (
  school_site_id INTEGER NOT NULL,
  special_day_class_teacher_id INTEGER NOT NULL,
  PRIMARY KEY (school_site_id, special_day_class_teacher_id),
  FOREIGN KEY (school_site_id) REFERENCES school_sites (id),
  FOREIGN KEY (special_day_class_teacher_id) REFERENCES special_day_class_teachers (special_day_class_teacher_id)
);
