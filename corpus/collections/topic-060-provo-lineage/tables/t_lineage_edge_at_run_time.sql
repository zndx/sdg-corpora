CREATE TABLE t_lineage_edge_at_run_time (
  id VARCHAR(255),
  lineage VARCHAR(255),
  at_run_time VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_at_run_time"}'
