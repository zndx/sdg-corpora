CREATE TABLE assessment_instruments (
  instrument_code INTEGER NOT NULL,
  instrument_name VARCHAR(32),
  format VARCHAR(32),
  administering_body VARCHAR(32),
  validity_period_months INTEGER,
  is_deprecated BOOLEAN,
  version_number VARCHAR(32),
  PRIMARY KEY (instrument_code)
);
