CREATE TABLE authorities_products (
  approving_authority_id INTEGER NOT NULL,
  approved_product_id INTEGER NOT NULL,
  PRIMARY KEY (approving_authority_id, approved_product_id),
  FOREIGN KEY (approving_authority_id) REFERENCES approving_authorities (approving_authority_id),
  FOREIGN KEY (approved_product_id) REFERENCES approved_products (id)
);
