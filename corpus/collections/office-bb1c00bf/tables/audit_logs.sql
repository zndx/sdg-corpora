CREATE TABLE audit_logs (
  audit_log_id INTEGER NOT NULL,
  log_id VARCHAR(44),
  action_type VARCHAR(32),
  user_id VARCHAR(44),
  timestamp TIMESTAMP,
  status VARCHAR(32),
  is_suspicious BOOLEAN,
  monitoring_tool_id INTEGER,
  system_metric_id INTEGER,
  PRIMARY KEY (audit_log_id),
  FOREIGN KEY (monitoring_tool_id) REFERENCES monitoring_tools (id),
  FOREIGN KEY (system_metric_id) REFERENCES system_metrics (id)
);
