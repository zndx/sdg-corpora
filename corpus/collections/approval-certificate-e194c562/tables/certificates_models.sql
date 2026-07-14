CREATE TABLE certificates_models (
  approval_certificate_id INTEGER NOT NULL,
  product_model_id INTEGER NOT NULL,
  PRIMARY KEY (approval_certificate_id, product_model_id),
  FOREIGN KEY (approval_certificate_id) REFERENCES approval_certificates (id),
  FOREIGN KEY (product_model_id) REFERENCES product_models (product_model_id)
);
