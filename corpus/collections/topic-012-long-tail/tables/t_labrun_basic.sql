CREATE TABLE t_labrun_basic (
  id VARCHAR(255),
  labrun VARCHAR(255),
  retry_count INTEGER,
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":false,"template_id":"labrun_basic"}'
