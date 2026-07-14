CREATE TABLE vpn_protocols (
  id INTEGER NOT NULL,
  protocol_name VARCHAR(32),
  encryption_standard VARCHAR(32),
  port_number INTEGER,
  transport_layer VARCHAR(32),
  is_deprecated BOOLEAN,
  security_rating VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);
