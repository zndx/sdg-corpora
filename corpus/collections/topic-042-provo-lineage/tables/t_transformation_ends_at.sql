CREATE TABLE t_transformation_ends_at (
  id VARCHAR(255),
  transformation VARCHAR(255),
  ended_at_time VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_ends_at"}'
