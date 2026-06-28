CREATE TABLE t_counter_metric_subclass (
  id VARCHAR(255),
  counter VARCHAR(255),
  metric_kind VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (metric_kind) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"counter_metric_subclass"}'
