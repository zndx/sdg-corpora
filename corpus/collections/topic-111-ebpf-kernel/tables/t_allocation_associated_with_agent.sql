CREATE TABLE t_allocation_associated_with_agent (
  id VARCHAR(255),
  allocation VARCHAR(255),
  was_associated_with VARCHAR(255) NOT NULL,
  phase VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_associated_with_agent"}'
