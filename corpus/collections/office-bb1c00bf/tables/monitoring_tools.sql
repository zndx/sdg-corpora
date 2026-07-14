CREATE TABLE monitoring_tools (
  id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  version VARCHAR(32),
  vendor VARCHAR(32),
  is_automated BOOLEAN,
  last_run_date DATE,
  server_id INTEGER,
  system_metric_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (server_id) REFERENCES servers (id),
  FOREIGN KEY (system_metric_id) REFERENCES system_metrics (id)
);
