CREATE TABLE financial_institutions (
  financial_institution_id INTEGER NOT NULL,
  institution_id INTEGER,
  legal_name VARCHAR(32),
  headquarters_city VARCHAR(32),
  headquarters_country VARCHAR(32),
  charter_type VARCHAR(32),
  fed_member_status BOOLEAN,
  regulatory_status VARCHAR(32),
  has_subsidiary_financial_institution_id INTEGER,
  compliance_investigation_id INTEGER,
  PRIMARY KEY (financial_institution_id),
  FOREIGN KEY (has_subsidiary_financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (compliance_investigation_id) REFERENCES compliance_investigations (id)
);
