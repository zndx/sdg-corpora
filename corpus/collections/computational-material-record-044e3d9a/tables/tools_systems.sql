CREATE TABLE tools_systems (
  big_data_analytics_tool_id INTEGER NOT NULL,
  material_system_id INTEGER NOT NULL,
  PRIMARY KEY (big_data_analytics_tool_id, material_system_id),
  FOREIGN KEY (big_data_analytics_tool_id) REFERENCES big_data_analytics_tools (id),
  FOREIGN KEY (material_system_id) REFERENCES material_systems (id)
);
