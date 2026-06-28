CREATE TABLE t_metric_observed_by_event (
  id VARCHAR(255),
  metric VARCHAR(255),
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"metric_observed_by_event"}'
