CREATE TABLE centers_pipelines (
  center_id VARCHAR(32) NOT NULL,
  pipeline_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (center_id, pipeline_id),
  FOREIGN KEY (center_id) REFERENCES high_performance_computer_centers (center_id),
  FOREIGN KEY (pipeline_id) REFERENCES parsing_pipelines (pipeline_id)
);
