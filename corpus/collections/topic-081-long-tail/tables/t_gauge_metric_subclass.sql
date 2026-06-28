CREATE TABLE t_gauge_metric_subclass (
  id VARCHAR(255),
  gauge VARCHAR(255),
  metric_kind VARCHAR(255) NOT NULL,
  identifier VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (metric_kind) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"gauge_metric_subclass"}'
