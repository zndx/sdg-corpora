CREATE TABLE t_transformation_not_recoverable (
  id VARCHAR(255),
  transformation VARCHAR(255),
  transformation_2 VARCHAR(255),
  scheduled_at TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_not_recoverable"}'
