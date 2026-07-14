CREATE TABLE industrial_facilities (
  id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  location VARCHAR(32),
  operational_status VARCHAR(32),
  capacity DECIMAL,
  revenue_u_s_d DECIMAL,
  country_code VARCHAR(44),
  company_id VARCHAR(32),
  wood_product_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (country_code) REFERENCES countries (country_code),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (wood_product_id) REFERENCES wood_products (wood_product_id)
);
