CREATE TABLE tools_competitors (
  tool_id VARCHAR(32) NOT NULL,
  competitor_id INTEGER NOT NULL,
  PRIMARY KEY (tool_id, competitor_id),
  FOREIGN KEY (tool_id) REFERENCES tools (tool_id),
  FOREIGN KEY (competitor_id) REFERENCES competitors (competitor_id)
);
