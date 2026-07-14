CREATE TABLE tools_lists (
  sanctions_screening_tool_id INTEGER NOT NULL,
  sanctions_list_id INTEGER NOT NULL,
  PRIMARY KEY (sanctions_screening_tool_id, sanctions_list_id),
  FOREIGN KEY (sanctions_screening_tool_id) REFERENCES sanctions_screening_tools (sanctions_screening_tool_id),
  FOREIGN KEY (sanctions_list_id) REFERENCES sanctions_lists (sanctions_list_id)
);
