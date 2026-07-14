CREATE TABLE security_platforms (
  id INTEGER NOT NULL,
  platform_id VARCHAR(44),
  platform_name VARCHAR(32),
  version VARCHAR(32),
  deployment_date DATE,
  compliance_framework VARCHAR(32),
  is_open_xdr BOOLEAN,
  automated_response_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (automated_response_id) REFERENCES automated_responses (automated_response_id)
);
