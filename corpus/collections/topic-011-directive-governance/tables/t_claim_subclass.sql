CREATE TABLE t_claim_subclass (
  id VARCHAR(255),
  claim VARCHAR(255),
  claim_about VARCHAR(255) NOT NULL,
  method VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (claim_about) REFERENCES t_column_tag_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"06_belief_structure","is_complex":true,"template_id":"claim_subclass"}'
