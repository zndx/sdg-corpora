CREATE TABLE t_lineage_edge_within_dataset_only (
  id VARCHAR(255),
  lineage VARCHAR(255),
  within_dataset VARCHAR(255),
  uncertainty DECIMAL(38,9),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_edge_within_dataset_only"}'
