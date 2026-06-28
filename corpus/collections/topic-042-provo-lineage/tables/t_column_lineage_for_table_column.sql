CREATE TABLE t_column_lineage_for_table_column (
  id VARCHAR(255),
  column VARCHAR(255),
  column_2 VARCHAR(255) NOT NULL,
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"column_lineage_for_table_column"}'
