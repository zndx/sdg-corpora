CREATE TABLE t_column_lineage_describes_pair (
  id VARCHAR(255),
  column VARCHAR(255),
  from_column VARCHAR(255) NOT NULL,
  to_column VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  method VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"column_lineage_describes_pair"}'
