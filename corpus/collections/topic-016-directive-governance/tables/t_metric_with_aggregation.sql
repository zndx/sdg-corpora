CREATE TABLE t_metric_with_aggregation (
  id VARCHAR(255),
  metric VARCHAR(255),
  aggregation_temporality VARCHAR(255) NOT NULL,
  version INTEGER,
  tags VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (aggregation_temporality) REFERENCES t_labrun_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"07_long_tail","is_complex":true,"template_id":"metric_with_aggregation"}'
