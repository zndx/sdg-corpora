CREATE TABLE financial_licences (
  id INTEGER NOT NULL,
  licence_number VARCHAR(32),
  licence_holder VARCHAR(32),
  issuing_authority VARCHAR(32),
  status VARCHAR(32),
  compliance_date DATE,
  PRIMARY KEY (id)
);
