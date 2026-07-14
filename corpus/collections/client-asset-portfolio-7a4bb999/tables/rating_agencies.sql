CREATE TABLE rating_agencies (
  id INTEGER NOT NULL,
  agency_identifier VARCHAR(42),
  agency_name VARCHAR(37),
  rating_methodology VARCHAR(32),
  last_review_date DATE,
  insurance_underwriter_id INTEGER,
  financial_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (insurance_underwriter_id) REFERENCES insurance_underwriters (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id)
);
