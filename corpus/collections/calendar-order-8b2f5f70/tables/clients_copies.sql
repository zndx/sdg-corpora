CREATE TABLE clients_copies (
  business_client_id INTEGER NOT NULL,
  ad_copy_id INTEGER NOT NULL,
  PRIMARY KEY (business_client_id, ad_copy_id),
  FOREIGN KEY (business_client_id) REFERENCES business_clients (id),
  FOREIGN KEY (ad_copy_id) REFERENCES ad_copies (ad_copy_id)
);
