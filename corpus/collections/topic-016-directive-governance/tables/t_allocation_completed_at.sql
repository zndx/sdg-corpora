CREATE TABLE t_allocation_completed_at (
  id VARCHAR(255),
  allocation VARCHAR(255),
  completed_at VARCHAR(255) NOT NULL,
  log_level VARCHAR(255),
  start_time TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_completed_at"}'
