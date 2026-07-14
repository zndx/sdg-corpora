CREATE TABLE agricultural_products (
  product_id VARCHAR(32) NOT NULL,
  product_name VARCHAR(32),
  product_category VARCHAR(32),
  weight DECIMAL,
  unit_of_measure VARCHAR(32),
  price DECIMAL,
  expiry_date DATE,
  participating_organization_id INTEGER,
  PRIMARY KEY (product_id),
  FOREIGN KEY (participating_organization_id) REFERENCES participating_organizations (participating_organization_id)
);
