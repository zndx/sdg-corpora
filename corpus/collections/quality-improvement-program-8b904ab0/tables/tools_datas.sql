CREATE TABLE tools_datas (
  analytic_tool_id INTEGER NOT NULL,
  clinical_performance_data_id INTEGER NOT NULL,
  PRIMARY KEY (analytic_tool_id, clinical_performance_data_id),
  FOREIGN KEY (analytic_tool_id) REFERENCES analytic_tools (analytic_tool_id),
  FOREIGN KEY (clinical_performance_data_id) REFERENCES clinical_performance_datas (clinical_performance_data_id)
);
