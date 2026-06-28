CREATE TABLE t_belief_interval_for_claim (
  id VARCHAR(255),
  belief VARCHAR(255),
  for_claim VARCHAR(255) NOT NULL,
  dimension_kind VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id),
  FOREIGN KEY (for_claim) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"belief_interval_for_claim"}'
