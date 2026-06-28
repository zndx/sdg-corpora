CREATE TABLE t_measurement_produced_by_run (
  id VARCHAR(255),
  measurement VARCHAR(255),
  recorded_at TIMESTAMP,
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_produced_by_run"}'
