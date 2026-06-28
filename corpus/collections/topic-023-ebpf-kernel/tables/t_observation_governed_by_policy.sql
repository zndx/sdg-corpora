CREATE TABLE t_observation_governed_by_policy (
  id VARCHAR(255),
  observation VARCHAR(255),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"observation_governed_by_policy"}'
