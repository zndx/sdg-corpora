CREATE TABLE t_transformation_generates_entity (
  id VARCHAR(255),
  transformation VARCHAR(255),
  generates_entity VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  phase VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"transformation_generates_entity"}'
