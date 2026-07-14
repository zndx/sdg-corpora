CREATE TABLE competitors_tools (
  competitor_id INTEGER NOT NULL,
  tool_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (competitor_id, tool_id),
  FOREIGN KEY (competitor_id) REFERENCES competitors (competitor_id),
  FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
);
