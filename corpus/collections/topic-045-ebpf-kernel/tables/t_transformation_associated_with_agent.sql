CREATE TABLE t_transformation_associated_with_agent (
  id VARCHAR(255),
  transformation VARCHAR(255),
  was_associated_with VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_associated_with_agent"}'
