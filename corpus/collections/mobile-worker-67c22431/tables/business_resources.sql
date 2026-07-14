CREATE TABLE business_resources (
  id INTEGER NOT NULL,
  resource_id INTEGER,
  resource_name VARCHAR(32),
  resource_type VARCHAR(32),
  access_protocol VARCHAR(32),
  is_s_s_o_supported BOOLEAN,
  max_connections INTEGER,
  user_role_id INTEGER,
  corporate_network_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (user_role_id) REFERENCES user_roles (id),
  FOREIGN KEY (corporate_network_id) REFERENCES corporate_networks (id)
);
