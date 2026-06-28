CREATE TABLE t_claim_with_belief_interval (
  id VARCHAR(255),
  claim VARCHAR(255),
  belief_interval VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (belief_interval) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"claim_with_belief_interval"}'
