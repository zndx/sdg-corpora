CREATE TABLE services_accounts (
  third_party_service_id INTEGER NOT NULL,
  customer_account_id INTEGER NOT NULL,
  PRIMARY KEY (third_party_service_id, customer_account_id),
  FOREIGN KEY (third_party_service_id) REFERENCES third_party_services (id),
  FOREIGN KEY (customer_account_id) REFERENCES customer_accounts (id)
);
