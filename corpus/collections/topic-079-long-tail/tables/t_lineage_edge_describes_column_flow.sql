CREATE TABLE t_lineage_edge_describes_column_flow (
  id VARCHAR(255),
  lineage VARCHAR(255),
  describes_column_flow VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  encoding VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_describes_column_flow"}'
