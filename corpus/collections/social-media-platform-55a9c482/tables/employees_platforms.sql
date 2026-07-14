CREATE TABLE employees_platforms (
  employee_id VARCHAR(32) NOT NULL,
  social_media_platform_id INTEGER NOT NULL,
  PRIMARY KEY (employee_id, social_media_platform_id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (id)
);
