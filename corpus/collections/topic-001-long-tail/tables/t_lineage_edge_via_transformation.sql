CREATE TABLE t_lineage_edge_via_transformation (
  id VARCHAR(255),
  lineage VARCHAR(255),
  via_transformation VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  uncertainty DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_via_transformation"}'
