CREATE TABLE certification_statistics (
  certification_statistic_id INTEGER NOT NULL,
  statistic_id VARCHAR(32),
  report_date DATE,
  total_certificates INTEGER,
  standard_specific_count INTEGER,
  geographic_region_id INTEGER,
  management_system_standard_id INTEGER,
  PRIMARY KEY (certification_statistic_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id),
  FOREIGN KEY (management_system_standard_id) REFERENCES management_system_standards (management_system_standard_id)
);
