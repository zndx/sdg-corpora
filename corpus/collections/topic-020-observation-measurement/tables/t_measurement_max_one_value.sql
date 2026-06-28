CREATE TABLE t_measurement_max_one_value (
  id VARCHAR(255),
  measurement VARCHAR(255),
  numeric_value VARCHAR(255),
  uncertainty DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (numeric_value) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_max_one_value"}'
