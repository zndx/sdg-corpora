CREATE TABLE t_column_lineage_for_compliance_claim (
  id VARCHAR(255),
  column VARCHAR(255),
  recorded_at TIMESTAMP,
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"column_lineage_for_compliance_claim"}'
