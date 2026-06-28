CREATE TABLE t_lineage_describes_transformation (
  id VARCHAR(255),
  lineage VARCHAR(255),
  confidence DECIMAL(38,9),
  recorded_at TIMESTAMP,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"lineage_describes_transformation"}'
