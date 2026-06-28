CREATE TABLE t_trace_with_attributes (
  id VARCHAR(255),
  trace VARCHAR(255),
  log_level VARCHAR(255),
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"trace_with_attributes"}'
