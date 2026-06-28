CREATE TABLE t_state_of_system_block (
  id VARCHAR(255),
  state VARCHAR(255),
  confidence DECIMAL(38,9),
  method VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"state_of_system_block"}'
