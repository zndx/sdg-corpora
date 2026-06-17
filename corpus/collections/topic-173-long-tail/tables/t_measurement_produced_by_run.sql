CREATE TABLE t_measurement_produced_by_run (
  id VARCHAR(255),
  subject VARCHAR(255),
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  unit VARCHAR(255),
  value DECIMAL(38,9),
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"02_observation_measurement","is_complex":true,"template_id":"measurement_produced_by_run"}'
