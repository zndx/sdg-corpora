CREATE TABLE tools (
  tool_id VARCHAR(32) NOT NULL,
  tool_name VARCHAR(32),
  tool_category VARCHAR(32),
  brand_reference VARCHAR(32),
  specification VARCHAR(32),
  tool_status VARCHAR(32),
  assessment_id INTEGER,
  PRIMARY KEY (tool_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (assessment_id)
);
