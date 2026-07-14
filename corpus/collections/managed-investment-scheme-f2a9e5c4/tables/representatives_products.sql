CREATE TABLE representatives_products (
  authorised_representative_id INTEGER NOT NULL,
  product_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (authorised_representative_id, product_id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id),
  FOREIGN KEY (product_id) REFERENCES financial_products (product_id)
);
