CREATE TABLE t_aggregation_aggregates_measurement (
  id VARCHAR(255),
  aggregation VARCHAR(255),
  aggregates VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (aggregates) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"aggregation_aggregates_measurement"}'
