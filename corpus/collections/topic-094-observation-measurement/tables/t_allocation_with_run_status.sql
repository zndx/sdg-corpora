CREATE TABLE t_allocation_with_run_status (
  id VARCHAR(255),
  allocation VARCHAR(255),
  run_status VARCHAR(255) NOT NULL,
  exit_code INTEGER,
  scheduled_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_with_run_status"}'
