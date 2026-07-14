CREATE TABLE certification_authorities (
  id INTEGER NOT NULL,
  authority_identifier VARCHAR(32),
  authority_name VARCHAR(32),
  certification_protocol VARCHAR(32),
  certification_frequency INTEGER,
  is_federal_agency VARCHAR(32),
  standard_weight_or_measure_id INTEGER,
  issues_certification_for_standard_weight_or_measure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (standard_weight_or_measure_id) REFERENCES standard_weight_or_measures (id),
  FOREIGN KEY (issues_certification_for_standard_weight_or_measure_id) REFERENCES standard_weight_or_measures (id)
);
