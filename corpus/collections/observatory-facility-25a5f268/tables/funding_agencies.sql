CREATE TABLE funding_agencies (
  id INTEGER NOT NULL,
  agency_id VARCHAR(39),
  agency_name VARCHAR(37),
  agency_type VARCHAR(32),
  division VARCHAR(32),
  program_code VARCHAR(32),
  oversight_responsibility VARCHAR(32),
  PRIMARY KEY (id)
);
