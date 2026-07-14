CREATE TABLE assessment_instruments (
  assessment_instrument_id INTEGER NOT NULL,
  instrument_id VARCHAR(32),
  instrument_name VARCHAR(32),
  instrument_type VARCHAR(32),
  validity_date DATE,
  reliability_coefficient DECIMAL,
  administered_by VARCHAR(32),
  PRIMARY KEY (assessment_instrument_id)
);
