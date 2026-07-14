CREATE TABLE fund_managers (
  fund_manager_id INTEGER NOT NULL,
  manager_identifier VARCHAR(32),
  manager_name VARCHAR(32),
  regulatory_license VARCHAR(32),
  management_fee_waived BOOLEAN,
  performance_fee_waived BOOLEAN,
  headquarters_country VARCHAR(32),
  total_a_u_m DECIMAL,
  years_in_operation INTEGER,
  PRIMARY KEY (fund_manager_id)
);
