CREATE TABLE authorised_representatives (
  id INTEGER NOT NULL,
  representative_id VARCHAR(32),
  representative_name VARCHAR(32),
  authorisation_date DATE,
  remuneration_rate DECIMAL,
  contact_email VARCHAR(32),
  financial_licence_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_licence_id) REFERENCES financial_licences (id)
);
