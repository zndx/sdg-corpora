CREATE TABLE t_observation_with_participant (
  id VARCHAR(255),
  observation VARCHAR(255),
  phase VARCHAR(255),
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"observation_with_participant"}'
