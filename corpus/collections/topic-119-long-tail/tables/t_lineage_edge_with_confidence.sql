CREATE TABLE t_lineage_edge_with_confidence (
  id VARCHAR(255),
  lineage VARCHAR(255),
  confidence VARCHAR(255) NOT NULL,
  recorded_at TIMESTAMP,
  unit VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_with_confidence"}'
