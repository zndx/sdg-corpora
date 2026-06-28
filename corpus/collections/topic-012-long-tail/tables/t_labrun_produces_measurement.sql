CREATE TABLE t_labrun_produces_measurement (
  id VARCHAR(255),
  labrun VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"02_observation_measurement","is_complex":true,"template_id":"labrun_produces_measurement"}'
