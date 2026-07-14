CREATE TABLE animal_services_officers (
  officer_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  badge_number VARCHAR(32),
  certification_status VARCHAR(32),
  driver_license_status VARCHAR(32),
  drug_test_status VARCHAR(32),
  criminal_history_status VARCHAR(32),
  citation_id VARCHAR(32),
  animal_id INTEGER,
  PRIMARY KEY (officer_id),
  FOREIGN KEY (citation_id) REFERENCES citations (citation_id),
  FOREIGN KEY (animal_id) REFERENCES animals (id)
);
