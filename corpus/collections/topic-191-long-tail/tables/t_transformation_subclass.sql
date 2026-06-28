CREATE TABLE t_transformation_subclass (
  id VARCHAR(255),
  transformation VARCHAR(255),
  uses_entity VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_subclass"}'
