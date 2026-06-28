CREATE TABLE t_allocation_succeeded_or_failed (
  id VARCHAR(255),
  allocation VARCHAR(255),
  allocation_2 VARCHAR(255),
  allocation_3 VARCHAR(255),
  status VARCHAR(255),
  triggered_by VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_succeeded_or_failed"}'
