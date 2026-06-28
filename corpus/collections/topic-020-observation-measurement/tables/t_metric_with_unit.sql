CREATE TABLE t_metric_with_unit (
  id VARCHAR(255),
  metric VARCHAR(255),
  metric_unit VARCHAR(255) NOT NULL,
  license VARCHAR(255),
  owner VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (metric_unit) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"metric_with_unit"}'
