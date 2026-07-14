CREATE TABLE platforms_employees (
  social_media_platform_id INTEGER NOT NULL,
  employee_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (social_media_platform_id, employee_id),
  FOREIGN KEY (social_media_platform_id) REFERENCES social_media_platforms (id),
  FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);
