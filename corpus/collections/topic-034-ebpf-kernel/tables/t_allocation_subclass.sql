CREATE TABLE t_allocation_subclass (
  id VARCHAR(255),
  allocation VARCHAR(255),
  executes_transformation VARCHAR(255) NOT NULL,
  scheduled_at TIMESTAMP,
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_subclass"}'
