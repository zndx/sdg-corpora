CREATE TABLE t_transformation_only_uses_datasets (
  id VARCHAR(255),
  transformation VARCHAR(255),
  uses_entity VARCHAR(255),
  duration_seconds DECIMAL(38,9),
  start_time TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_only_uses_datasets"}'
