CREATE TABLE institutions_agencies (
  financial_institution_id INTEGER NOT NULL,
  agency_id VARCHAR(39) NOT NULL,
  PRIMARY KEY (financial_institution_id, agency_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id),
  FOREIGN KEY (agency_id) REFERENCES regulatory_agencies (agency_id)
);
