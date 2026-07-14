CREATE TABLE sale_prospective_customers (
  id INTEGER NOT NULL,
  customer_id VARCHAR(32),
  company_name VARCHAR(32),
  contact_person VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  lead_source VARCHAR(32),
  status VARCHAR(32),
  quotation_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (quotation_id) REFERENCES sale_quotations (id)
);
