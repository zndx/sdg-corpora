CREATE TABLE t_measurement_basic (
  id VARCHAR(255),
  measurement VARCHAR(255),
  uncertainty DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":false,"template_id":"measurement_basic"}'
