CREATE TABLE t_alert_triggered_by (
  id VARCHAR(255),
  subject VARCHAR(255),
  triggered_by_metric VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  end_time TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (triggered_by_metric) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"07_long_tail","is_complex":true,"template_id":"alert_triggered_by"}'
