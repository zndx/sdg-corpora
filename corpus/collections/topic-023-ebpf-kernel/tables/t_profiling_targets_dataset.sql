CREATE TABLE t_profiling_targets_dataset (
  id VARCHAR(255),
  profiling VARCHAR(255),
  log_level VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"profiling_targets_dataset"}'
