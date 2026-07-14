CREATE TABLE networks_resources (
  corporate_network_id INTEGER NOT NULL,
  business_resource_id INTEGER NOT NULL,
  PRIMARY KEY (corporate_network_id, business_resource_id),
  FOREIGN KEY (corporate_network_id) REFERENCES corporate_networks (id),
  FOREIGN KEY (business_resource_id) REFERENCES business_resources (id)
);
