CREATE TABLE t_allocation_basic (
  id VARCHAR(255),
  allocation VARCHAR(255),
  exit_code INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":false,"template_id":"allocation_basic"}'
