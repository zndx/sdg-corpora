CREATE TABLE t_attribute_set_subclass (
  id VARCHAR(255),
  attribute VARCHAR(255),
  confidence DECIMAL(38,9),
  dimension_kind VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"attribute_set_subclass"}'
