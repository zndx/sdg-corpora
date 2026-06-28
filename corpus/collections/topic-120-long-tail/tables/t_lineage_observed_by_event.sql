CREATE TABLE t_lineage_observed_by_event (
  id VARCHAR(255),
  lineage VARCHAR(255),
  dimension_kind VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"05_provo_lineage","is_complex":true,"template_id":"lineage_observed_by_event"}'
