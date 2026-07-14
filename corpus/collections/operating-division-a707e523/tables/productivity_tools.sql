CREATE TABLE productivity_tools (
  id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  software_version VARCHAR(32),
  deployment_date TIMESTAMP,
  is_collaborative BOOLEAN,
  PRIMARY KEY (id)
);
