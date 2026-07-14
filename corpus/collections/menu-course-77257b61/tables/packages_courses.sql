CREATE TABLE packages_courses (
  dining_package_id INTEGER NOT NULL,
  menu_course_id INTEGER NOT NULL,
  PRIMARY KEY (dining_package_id, menu_course_id),
  FOREIGN KEY (dining_package_id) REFERENCES dining_packages (dining_package_id),
  FOREIGN KEY (menu_course_id) REFERENCES menu_courses (id)
);
