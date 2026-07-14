CREATE TABLE forest_plantations (
  id INTEGER NOT NULL,
  plantation_id VARCHAR(32),
  area_hectares DECIMAL,
  establishment_year INTEGER,
  certification_status VARCHAR(32),
  primary_species VARCHAR(32),
  land_use_history VARCHAR(32),
  country_code VARCHAR(44),
  company_id VARCHAR(32),
  wood_product_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (country_code) REFERENCES countries (country_code),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (wood_product_id) REFERENCES wood_products (wood_product_id)
);
