CREATE TABLE adapters_connectors (
  adapter_id INTEGER NOT NULL,
  display_connector_id INTEGER NOT NULL,
  PRIMARY KEY (adapter_id, display_connector_id),
  FOREIGN KEY (adapter_id) REFERENCES adapters (adapter_id),
  FOREIGN KEY (display_connector_id) REFERENCES display_connectors (display_connector_id)
);
