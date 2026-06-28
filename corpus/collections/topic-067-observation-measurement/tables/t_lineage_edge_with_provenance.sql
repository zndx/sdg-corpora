CREATE TABLE t_lineage_edge_with_provenance (
  id VARCHAR(255),
  lineage VARCHAR(255),
  with_provenance VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_with_provenance"}'
