CREATE TABLE tools_datas (
  quantitative_analytic_tool_id INTEGER NOT NULL,
  clinical_performance_data_id INTEGER NOT NULL,
  PRIMARY KEY (quantitative_analytic_tool_id, clinical_performance_data_id),
  FOREIGN KEY (quantitative_analytic_tool_id) REFERENCES quantitative_analytic_tools (id),
  FOREIGN KEY (clinical_performance_data_id) REFERENCES clinical_performance_datas (clinical_performance_data_id)
);
