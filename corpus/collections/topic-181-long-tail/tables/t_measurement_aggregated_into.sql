CREATE TABLE t_measurement_aggregated_into (
  id VARCHAR(255),
  measurement VARCHAR(255),
  aggregated_into VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (aggregated_into) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_aggregated_into"}'
