CREATE TABLE t_state_basic (
  id VARCHAR(255),
  state VARCHAR(255),
  method VARCHAR(255),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":false,"template_id":"state_basic"}'
