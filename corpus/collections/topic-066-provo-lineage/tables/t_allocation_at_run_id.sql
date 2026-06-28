CREATE TABLE t_allocation_at_run_id (
  id VARCHAR(255),
  allocation VARCHAR(255),
  at_run_identifier VARCHAR(255) NOT NULL,
  duration_seconds DECIMAL(38,9),
  retry_count INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_at_run_id"}'
