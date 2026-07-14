CREATE TABLE system_metrics (
  id INTEGER NOT NULL,
  metric_id VARCHAR(44),
  metric_type VARCHAR(32),
  value DECIMAL,
  timestamp TIMESTAMP,
  unit VARCHAR(32),
  is_anomalous BOOLEAN,
  server_id INTEGER,
  monitoring_tool_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (monitoring_tool_id) REFERENCES monitoring_tools (id)
);
