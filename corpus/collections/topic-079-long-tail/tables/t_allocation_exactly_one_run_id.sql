CREATE TABLE t_allocation_exactly_one_run_id (
  id VARCHAR(255),
  allocation VARCHAR(255),
  at_run_identifier VARCHAR(255),
  phase VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:Process"],"family":"05_provo_lineage","is_complex":true,"template_id":"allocation_exactly_one_run_id"}'
