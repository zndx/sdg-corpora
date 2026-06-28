CREATE TABLE t_transformation_starts_at (
  id VARCHAR(255),
  transformation VARCHAR(255),
  started_at_time VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  host_name VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_starts_at"}'
