CREATE TABLE clinical_performance_datas (
  clinical_performance_data_id INTEGER NOT NULL,
  data_record_id INTEGER,
  collection_date TIMESTAMP,
  metric_type VARCHAR(32),
  value DECIMAL,
  unit_of_measure VARCHAR(32),
  data_quality_score DECIMAL,
  measurement_activity_id INTEGER,
  analytic_tool_id INTEGER,
  PRIMARY KEY (clinical_performance_data_id),
  FOREIGN KEY (measurement_activity_id) REFERENCES measurement_activities (id),
  FOREIGN KEY (analytic_tool_id) REFERENCES analytic_tools (analytic_tool_id)
);
