CREATE TABLE application_domains (
  application_domain_id INTEGER NOT NULL,
  domain_name VARCHAR(32),
  laser_diode_module_part_number VARCHAR(32),
  PRIMARY KEY (application_domain_id),
  FOREIGN KEY (laser_diode_module_part_number) REFERENCES laser_diode_modules (part_number)
);
