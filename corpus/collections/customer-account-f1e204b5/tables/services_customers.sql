CREATE TABLE services_customers (
  third_party_service_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
  PRIMARY KEY (third_party_service_id, customer_id),
  FOREIGN KEY (third_party_service_id) REFERENCES third_party_services (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);
