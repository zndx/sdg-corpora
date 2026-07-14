CREATE TABLE disqualified_activities (
  id INTEGER NOT NULL,
  activity_code VARCHAR(44),
  activity_name VARCHAR(32),
  is_de_minimis BOOLEAN,
  de_minimis_threshold DECIMAL,
  anti_abuse_rule BOOLEAN,
  exclusion_status VARCHAR(32),
  trade_or_business_employer_id VARCHAR(61),
  tax_deduction_id INTEGER,
  tax_regulation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (trade_or_business_employer_id) REFERENCES trade_or_businesses (employer_id),
  FOREIGN KEY (tax_deduction_id) REFERENCES tax_deductions (tax_deduction_id),
  FOREIGN KEY (tax_regulation_id) REFERENCES tax_regulations (tax_regulation_id)
);
