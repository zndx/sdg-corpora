CREATE TABLE t_lineage_edge_max_one_target (
  id VARCHAR(255),
  lineage VARCHAR(255),
  to_target VARCHAR(255),
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_max_one_target"}'
