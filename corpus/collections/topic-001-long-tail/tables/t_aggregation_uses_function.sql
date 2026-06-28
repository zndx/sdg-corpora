CREATE TABLE t_aggregation_uses_function (
  id VARCHAR(255),
  aggregation VARCHAR(255),
  uses_aggregation_function VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (uses_aggregation_function) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"aggregation_uses_function"}'
