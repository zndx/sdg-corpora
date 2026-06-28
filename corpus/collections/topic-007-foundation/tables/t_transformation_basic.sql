CREATE TABLE t_transformation_basic (
  id VARCHAR(255),
  transformation VARCHAR(255),
  exit_code INTEGER,
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":false,"template_id":"transformation_basic"}'
