CREATE TABLE t_metric_emission_subclass (
  id VARCHAR(255),
  subject VARCHAR(255),
  emits_metric VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (emits_metric) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"metric_emission_subclass"}'
